param (
    $device_name
)

$server_path = "RASPBERRYPI\Backup"
$locations = Get-Content -Path .\backup_locations.txt

foreach ($line in $locations) {
    $curr_line = "$line".split("\")[-1]
    robocopy $line \\"$server_path"\"$device_name"_backup\"$curr_line" /e /compress /mt /z
}
