# Video Organize

This a simple `Bash` script that find the files with extension you want, rename and move to any directory.

The first purpose of this script is for video organizing for platforms like Plex, Kodi, Jellyfin, etc.

Only need put the script in a dir and run!


PD: More improvements are coming...


### Explain Script

The script detect files that contain the next sequence:
```bash
filename-s01e01.mkv
filename_S01e04.mkv
.
.
.
```

Or other some variations of the above. The script need a name for videos (for example: MyVideo) and it apply the next changes over files:
```bash
MyVideo-s01e01.mkv
MyVideo-s01e04.mkv
.
.
.
```