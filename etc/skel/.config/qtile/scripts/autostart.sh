#!/usr/bin/env bash 

COLORSCHEME=DoomOne


### AUTOSTART PROGRAMS ###
# lxsession &
picom --daemon &
#/usr/bin/emacs --daemon &
#nm-applet &
#"$HOME"/.screenlayout/layout.sh &
#sleep 1
#conky -c "$HOME"/.config/conky/qtile/01/"$COLORSCHEME".conf || echo "Couldn't start conky."

### UNCOMMENT ONLY ONE OF THE FOLLOWING THREE OPTIONS! ###
# 1. Uncomment to restore last saved wallpaper
#xargs xwallpaper --stretch < ~/.cache/wall &
# 2. Uncomment to set a random wallpaper on login
# find /usr/share/backgrounds/dtos-backgrounds/ -type f | shuf -n 1 | xargs xwallpaper --stretch &
# 3. Uncomment to set wallpaper with nitrogen
# nitrogen --restore &

# extra from ArcoLinux


function run {
  if ! pgrep -x $(basename $1 | head -c 15) 1>/dev/null;
  then
    $@&
  fi
}

#Set your native resolution IF it does not exist in xrandr
#More info in the script
#run $HOME/.config/qtile/scripts/set-screen-resolution-in-virtualbox.sh

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#autorandr horizontal

##changed via give-me-azerty-qtile
#setxkbmap be

#autostart ArcoLinux Welcome App
run dex $HOME/.config/autostart/arcolinux-welcome-app.desktop &

#Some ways to set your wallpaper besides variety or nitrogen
feh --bg-fill /usr/share/backgrounds/archlinux/arch-wallpaper.jpg &
feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &
#wallpaper for other Arch based systems
#feh --bg-fill /usr/share/archlinux-tweak-tool/data/wallpaper/wallpaper.png &

#start sxhkd to replace Qtile native key-bindings
run sxhkd -c ~/.config/qtile/sxhkd/sxhkdrc &

#starting utility applications at boot time
run variety &
run nm-applet &
#run pamac-tray &
run xfce4-power-manager &
numlockx on &
blueberry-tray &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &

#starting user applications at boot time
run volumeicon &
#run discord &
#nitrogen --restore &
#run caffeine -a &
#run vivaldi-stable &
#run firefox &
#run thunar &
#run dropbox &
#run insync start &
#run spotify &
#run atom &
#run telegram-desktop &
#run /usr/bin/octopi-notifier &
