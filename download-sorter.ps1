# UBER FILE SORTER FOR LIFE

# set utf-8 encoding
$OutputEncoding = New-Object -typename System.Text.UTF8Encoding
[Console]::OutputEncoding = New-Object -typename System.Text.UTF8Encoding

# set basic dir to sort files in
New-Variable -Name "BaseDir" -Value "D:\Downloads\"
$Dirs = "Music", "Pictures", "Movies", "Programs"

foreach ($d in $Dirs) {
    if (!(Test-Path -Path "$BaseDir$d" )) {
        New-Item -ItemType directory -Path "$BaseDir$d"
    }
}

$movies = "mov", "flv", "mp4", "mkv"
$audio = "mp3", "ogg", "wma", "flac", "cue", "pls"
$images = "jpeg", "jpg", "png", "gif", "bmp", "raw"
$programs = "exe", "msi", "py", "rb", "ps1", "php"
$extensions = $movies, $audio, $images, $programs

foreach ($ExtList in $extensions) {
    foreach ($ext in $ExtList) {
        dir "$BaseDir*.$ext" | select BaseName,Extension
    }
}