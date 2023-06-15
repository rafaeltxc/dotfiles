# Backup.sh
Shell configuration script for directory backup automation.

First, the script runs a *find* command, searching for any backups that were made more than 6 ours ago, and remove them.

Second, the script has 4 variables:
  - TIME: create a string with the computer's current date.
  - FILENAME: create a string with a given name + the TIME variable value.
  - SRCDIR: path to the directory that is being backed up.
  - DESDIR: path to the directory where the back up will be stored.

All the variables together are used with a tar command for the directory's compression.

### Usage
Change the deletion's time of the backed up directory, and the name of the files as you please.

For the scripts automation, you can use it as a cron job.
On linux terminal, use the command "your_editor crontab -e", to create a new crontab configuration for your user (default editor is nano, if not altered in the system).
Inside the editor, write the following:
```console
minute hour day month weekday  <path-to-the-script>
```
The Scheduling is made by giving the exact time you want, the month of the year, the day of the week, the hours, and the minutes.

An example of usage of the script would be:
```console
# script
!/bin/bash

find /BackupDirectory/* -mmin +354 -exec rm -rf {} \;

TIME=`date +%I-%d-%b`
FILENAME=backup-$TIME.tar.gz
SRCDIR=/home/user/directory
DESDIR=/backup (the directory should be already created)
tar -cpzf $DESDIR/$FILENAME $SRCDIR

# crontab
0 */2 * * * /backup.sh
```
It would run the script every two hours, so if you started the job at 00:00 AM, it would run again at 02:00 AM, then at 04:00 AM and so on.

# .config files
Desktop configuration files for linux

### Needed packages

  - alacrity
    - alacritty-colorscheme
  - zsh
    - zsh-autosuggestion
    - zsh-syntax-highlighting
    - lf
  - i3wm
    - i3lock
    - JetBrainsMono Nerd Font
  - polybar
    - pulseaudio
    - pavucontrol
    - playerctl
  - rofi
    - rofi-calc
    - Papirus icon theme
  - spt (spotify-tui)
    - spotifyd
