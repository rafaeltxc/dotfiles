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

# i3-config (windows manager)
Current i3 config. The most part of it is just the default configuration with some more installations:
  - rofi: control the window selection with alt+tab shortcut.
  - xfce4-appfinder: show all the applications installed in the system with $mod+q shortcut.
  - feh: used to change the desktop wallpaper.

### Usage
Install the following packages:
  - i3-gaps
  - i3-status
  - dmenu
  - rofi
  - xfce4-appfinder
  - feh
 
The configuration path is located at: /home/*user*/.config/i3/.

Changing the file and pressing $mod+shit+r should refresh the workspace.

Obs.: The configured terimnal is gnome-terminal, so if do not have it installed, the terminal won't work.


# Vimrc
Current configuration for vim editor.

Installed plugins:
 - https://github.com/itchyny/lightline.vim
 - https://github.com/itchyny/vim-gitbranch
 - https://github.com/tpope/vim-fugitive
 - https://github.com/tpope/vim-commentary
 - https://github.com/mg979/vim-visual-multi
 - https://github.com/sheerun/vim-polyglot
 - https://github.com/airblade/vim-gitgutter
 - https://github.com/neoclide/coc.nvim
 - https://github.com/ap/vim-buftabline
 - https://github.com/preservim/nerdtree
 - https://github.com/tpope/vim-surround
 - https://github.com/dikiaap/minimalist
 - https://github.com/ervandew/supertab

### Usage
Use https://github.com/junegunn/vim-plug package to be able to install all the plugins.

Change the configuration file at: /home/*user*/.vimrc. Open vim, and run the command *:PlugInstall*. Once all the plugins are installed, it's ready for use.

The shortcuts are the default of each package.

# Vscode-settings
Current visual-studio-code configuration file. You should be able to use it just overwriting your current settings.json and installing the respective plugins.
