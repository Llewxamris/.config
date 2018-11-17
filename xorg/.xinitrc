nextcloud &
emacs --daemon &
xmodmap ~/.Xmodmap &
slstatus &
compton -b -c -r 10 -o 0.5 &
feh $HOME/pape.png --bg-fill &
exec dwm
