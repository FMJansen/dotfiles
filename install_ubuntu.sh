#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Define copy function to add files to home dir
function copy {
    read -p "Do you want to copy ${DIR}/files/$1 to ~/.$1? [y/N] "
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        cp ${DIR}/templates/$1 ~/.$1
        sed -i "s/{{dotfiles}}/$(echo $DIR | sed -e 's/[\/&]/\\&/g')/g" ~/.$1
    fi
}

# Add dotfiles to home dir
for file in ${DIR}/templates/*; do
    copy $(basename $file)
done

# Download and install Atom + packages
wget "https://github.com/atom/atom/releases/download/v1.0.7/atom-amd64.deb"
sudo dpkg --install atom-amd64.deb
apm install emmet
apm install autocomplete-paths
apm install color-picker

# Set screenshot directory to folder in Pictures
gsettings set org.gnome.gnome-screenshot auto-save-directory "file:///home/$USER/Pictures/Screenshots"

# Install LAMP
sudo apt-get install lamp-server^

# Display url with instructions to change first week day in Gnome Shell
echo "Gnome shell week start: http://askubuntu.com/questions/197613/monday-as-first-day-in-gnome-shell-instead-of-sunday"

# Display urls with SSD related links
echo "SSD(?): https://sites.google.com/site/easylinuxtipsproject/ssd, http://askubuntu.com/questions/1400/how-do-i-optimize-the-os-for-ssds"

# Display urls for Gnome extensions
echo "Icons: https://extensions.gnome.org/extension/302/windowoverlay-icons/
  Navigator: https://extensions.gnome.org/extension/10/windownavigator/
  Accesibility: https://extensions.gnome.org/extension/112/remove-accesibility/
  Volume: https://extensions.gnome.org/extension/212/advanced-volume-mixer/"

# Display url for Apple Keyboard
echo "AppleKeyboard: https://help.ubuntu.com/community/AppleKeyboard"

# Display Dropbox url
echo "Dropbox: https://www.dropbox.com/downloading?os=lnx"
#https://www.dropbox.com/downloading?os=mac

# Display Chrome url
echo "Chrome: https://www.google.com/intl/en/chrome/browser/desktop/index.html"

# Display multi-finger support Bamboo
echo "Bamboo 3+: http://ubuntuforums.org/showthread.php?t=2125990"

#open "https://nodejs.org/"
#open "https://justgetflux.com/dlmac.html"

#tput bel
