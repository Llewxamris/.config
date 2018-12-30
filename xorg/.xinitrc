nextcloud &
emacs --daemon &
xmodmap ~/.Xmodmap &
slstatus &
compton -b -c -r 10 -o 0.5 -t -10 &
feh $HOME/pape.png --bg-fill &
dunst &
xautolock -time 5 -locker slock -notify 10 -notifier "notify-send Locking..." -secure -detectsleep -corners 0-00 &
exec dwm
