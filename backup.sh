# We're using the 3-2-1 rule for our backup solution: https://www.veeam.com/blog/321-backup-rule.html
# Copy 1 is our live data stored on the current host device

while getopts "dpz" flag
do
    case "${flag}" in
        d) local_backup_dir=${OPTARG};;
        p) rclone_config_password=${OPTARG};;
    esac
done

backup_title="$(date '+%Y-%m-%d')-backup"

# Create core temporary backup directory that all backups will pull from
echo "Generating core backup file"
rsync -a services/ backup_temp/$backup_title
if [[ $? = 0 ]]; then
    echo "Compressing core backup file"
    #* Backup_temp folder helps prevent dev from fucking this process up while it's running
    #* Syncdir intermediary is because rsync works at dir-level, not file-level
    zip -rm backup_temp/$backup_title.zip backup_temp/$backup_title
    if [[ $? = 0 ]]; then

        echo "Core backup file has been successfully generated. Synchronizing core backup to targets."

        core_backup_target="backup_temp"

        # Copy 2 - Local Physical Backup with External Hard Drive
        if [[ -z "$local_backup_dir" ]]; then
            echo "WARNING!!! No local backup directory was provided. Skipping the local physical backup. A directory for local backup should always be provided using the '-d' flag."
        else
            if [[ -d "$local_backup_dir" ]]; then
                echo "Valid local backup directory detected at $local_backup_dir. Attempting local physical backup."
                echo "Syncing core backup to local backup target at $local_backup_dir"
                rsync -av $core_backup_target.zip $local_backup_dir/$backup_title.zip || echo "Local physical backup failed. Skipping local physical backup."
            else
                echo "The backup directory provided could not be found. Please provide a full absolute path to the drive and location where the local physical backup should be stored using the '-d' flag."
                echo "Local physical backup failed. Skipping local physical backup."
            fi
        fi

        # Copy 3 - Remote Backup to Google Drive
        rclone_config_path="/Users/gabe/.config/rclone/rclone.conf"
        rclone_remote_name="hhhomelab_google_drive"
        cloud_backup_dir="/homiehub_homelab/server_backups"
        cloud_backup_target="$rclone_remote_name:$cloud_backup_dir/$backup_title.zip"

        echo "Syncing core backup to remote backup target at $cloud_backup_target"
        rclone copy $core_backup_target $cloud_backup_target --progress --log-level=DEBUG --multi-thread-streams=8 --disable-http2 --ignore-checksum

    else
        echo "Core backup failed to compress. Aborting backup process."
    fi
else
    echo "Core backup generation failed."
fi

echo "Cleaning up temp files"
rm -rf backup_temp/*
