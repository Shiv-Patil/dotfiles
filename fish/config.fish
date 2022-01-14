function fish_greeting
    fortune -a
    pfetch
end
funcsave fish_greeting

if test -n "$DESKTOP_SESSION"
    set -x (gnome-keyring-daemon --start | string split "=")
end
