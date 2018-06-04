export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

bri () {
        if [ -z $1 ]; then
                cat /sys/class/backlight/radeon_bl0/brightness
        elif [ $1 = "full" ]; then
                echo 255 > /sys/class/backlight/radeon_bl0/brightness
        else
                echo $1 > /sys/class/backlight/radeon_bl0/brightness
        fi
}
