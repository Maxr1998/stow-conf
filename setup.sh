#!/usr/bin/fish

set enabled_modules desktop i3 terminal vim vscode

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
	for dir in */
		set mod (echo $dir | sed 's|/$||')
		colorecho "CURRENTLY UNLINKING $mod"
		stow -D -t ~ "$mod"
	end
else
	for mod in $enabled_modules
		colorecho "CURRENTLY LINKING $mod"
		stow -t ~ "$mod"
	end
end

set gdm_xsession_default 'xrdb -nocpp -merge "$userresources"'
set gdm_xsession_replace 'xrdb -merge "$userresources"'

if grep -q $gdm_xsession_default /etc/gdm/Xsession
	colorecho "Patching GDM Xsession"
	sudo sed -i "s/$gdm_xsession_default/$gdm_xsession_replace/" /etc/gdm/Xsession
end

# vim: noet
