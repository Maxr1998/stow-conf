#!/usr/bin/fish

function colorecho 
	# Set color to cyan
	tput setaf 4
	# Make text bold
	tput bold
	echo $argv
	# Reset everything
	tput sgr0
end

set -l I3_DIR i3/.config/i3

if count $argv > /dev/null
    and test $argv[1] = "pkg"
    which pacman > /dev/null
    if test $status -eq 0
        colorecho "Arch Linux detected, installing packages if required.."
        sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
        sudo pacman -Syu
        sudo pacman -S --needed (cat pkgs.txt)
        echo
        colorecho "Installing custom config package"
        set stow_root "$PWD"
        cd i3/.config/i3/arch_pkg/
        makepkg -fci
        cd $stow_root
        echo
        colorecho "Install manually afterwards:"
        colorecho "- https://aur.archlinux.org/package-query.git"
        colorecho "- https://aur.archlinux.org/yay.git"
        colorecho "yay -S --needed --noconfirm polybar-git i3lock-color-git \\ "
        colorecho "materia-gtk-theme numix-circle-icon-theme-git numix-icon-theme-git ttf-font-icons"
        echo
    end
    sleep 3
end

echo
colorecho "Setting up directories"
mkdir -p ~/.config/fish/
mkdir -p ~/.vim/ftdetect/
mkdir -p ~/.config/Code\ -\ OSS/User/
mkdir -p ~/.config/jftui/

colorecho "Checking for Vundle"
if not test -d ~/.vim/bundle/Vundle.vim
    colorecho "Installing.."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
end

if count $argv > /dev/null
   and [ $argv[1] = "teardown" ]
    for pkg in *
        colorecho "CURRENTLY UNLINKING $pkg"
        stow -D -t ~ "$pkg"
    end
else
    for dir in */
        set pkg (echo $dir | sed 's|/$||')
        colorecho "CURRENTLY LINKING $pkg"
        stow -t ~ "$pkg"
    end
end

colorecho "Patching GDM Xsession"
sudo sed -i 's/xrdb -nocpp -merge "$userresources"/xrdb -merge "$userresources"/' /etc/gdm/Xsession

