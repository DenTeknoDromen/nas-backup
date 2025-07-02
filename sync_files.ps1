param (
    $device_name
)

$server_path = "RASPBERRYPI\Backup"
robocopy \\$server_path\ .\backups\ *_backup.zip /xf "$device_name*" /xf /compress /mt /z