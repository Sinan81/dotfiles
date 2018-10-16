alias octave='octave --no-gui'
alias locate='locate -i'
#move to trash as opposed to removing files
alias rmv='mv -v -t ~/.local/share/Trash/files/'
#copy from commandline to desktop clipboard
alias c='xsel --clipboard'
alias date_nospace='date | sed "s/ /_/g"'

#create 2x2 workspace from command line
alias 2by2='xprop -root -f _NET_DESKTOP_LAYOUT 32cccc -set _NET_DESKTOP_LAYOUT 0,2,2,0'

#grep ignore case
alias grep='grep --color=auto -i'
export PATH=$PATH:${HOME}/bin
#display paths nicely
alias paths='echo $PATH | sed -e "s/:/\n/g" '
#week starts on Monday
alias cal='cal -M'
alias ncal='ncal -bM'

#keyboard costomizations for sony vaio netbook VPC...
# switch Page-up (Prior) <-> Home and Page-down (Next) <-> End
alias switchhome='xmodmap -e "keysym Home = Prior" -e "keysym Prior = Home" -e "keysym End  = Next" -e "keysym Next = End"'
alias undo-switchhome='xmodmap  -e "keysym Prior = Home" -e "keysym Home = Prior"  -e "keysym Next = End" -e "keysym End  = Next"'
alias menukey='xmodmap -e "keysym Insert = Menu"'
#keyboard costomization for Dell XPS 13 L322X
# make the keyboard layout like the standard US one via switching Enter & Backslash keys
alias return2backslash='xmodmap -e "keycode 36 = backslash bar" -e "keycode 51 = Return"'
alias undo.return2backslash='xmodmap -e "keycode 51 = backslash bar" -e "keycode 36 = Return"'

alias joltscreen="xrandr --output eDP1 --mode 1920x1080"
alias quit='gnome-session-quit'
alias less='less -ir'
alias bc="bc --mathlib"

#if in a directory containing git repo, indicate so and display the branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \n$ "

alias l1="ls -1"
alias dmesg='dmesg -T'
alias ls='ls --color=auto'

