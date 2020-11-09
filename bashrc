alias octave='octave --no-gui'
alias locate='locate -i'

# move to trash as opposed to removing files
alias rmv='mv -v -t ~/.local/share/Trash/files/'

# copy from commandline to desktop clipboard: example: echo  "Hello" | c
alias c='xsel --clipboard'

alias date_nospace='date | sed "s/ /_/g"'

# create 2x2 workspace from command line
alias 2by2='xprop -root -f _NET_DESKTOP_LAYOUT 32cccc -set _NET_DESKTOP_LAYOUT 0,2,2,0'

export PATH=$PATH:${HOME}/bin
# display paths nicely
alias paths='echo $PATH | sed -e "s/:/\n/g" '

# keyboard costomizations for sony vaio netbook VPC...
alias switchhome='xmodmap -e "keysym Home = Prior" -e "keysym Prior = Home" -e "keysym End  = Next" -e "keysym Next = End"'
alias undo-switchhome='xmodmap  -e "keysym Prior = Home" -e "keysym Home = Prior"  -e "keysym Next = End" -e "keysym End  = Next"'
alias menukey='xmodmap -e "keysym Insert = Menu"'
# keyboard costomization for Dell XPS 13 L322X: standard US like keybrd layout
alias return2backslash='xmodmap -e "keycode 36 = backslash bar" -e "keycode 51 = Return"'
alias undo-return2backslash='xmodmap -e "keycode 51 = backslash bar" -e "keycode 36 = Return"'

# restore screen if for some reason orientation and/or resolution is altered
alias joltscreen="xrandr --output eDP1 --mode 1920x1080"

# lock screen from command line just in case Ctrl+Alt+L is not set
alias lock='dm-tool lock'
# log-out from command line
alias quit='mate-session-save --force-logout'
# alias quit='gnome-session-quit' # for gnome desktop

# if in a directory containing git repo, indicate so and display the branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \n$ "

alias less='less -ir'
alias bc="bc --mathlib"
alias grep='grep --color=auto -i'
# week starts on Monday
alias cal='cal -M'
alias ncal='ncal -bM'
alias l1="ls -1"
alias dmesg='dmesg -T'
alias ls='ls --color=auto'

# inxi by default should display basic system info
alias inxi='inxi -b'
# alias for foxit pdf editor, works nicely under linux via wine
alias foxit='wine "/home/$USER/.wine/drive_c/Program Files/Foxit Software/Foxit Reader/FoxitReader.exe"'

# don't know why but one needs to use exact path to 'time' to enable options like -v etc
alias time='/usr/bin/time -v'

# replace spaces with underscore in file/foldernames
unspaceit () { mv -v "$1" `echo $1 | sed 's/ /_/g'`; }

# convert uppercase characters to lowercase in file/foldernames
lowerit () { mv -v "$1" `echo "$1" | tr '[A-Z]' '[a-z]'` ; }

# sink the stderr etc when evince is opened from terminal
eevince () { `which xreader` $1 2>&1 > /dev/null ;}

# gnotime
gnohobby (){
  # check if VM is already running or not
  if [ $( vboxmanage showvminfo "Mint" | grep -c "running (since" ) = "0" ] ; then
    vboxheadless --startvm Mint 2>&1 > /dev/null &
    sleep 15
    ssh -X -p 2345 hobbyuser@localhost gnotime
  else
    ssh -X -p 2345 hobbyuser@localhost gnotime
  fi
}

alias lsb_release='lsb_release --all'
alias xo='xdg-open'
