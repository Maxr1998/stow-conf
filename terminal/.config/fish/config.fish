### Environment ###

set -gx GOPATH $HOME/Apps/go

# Path
set -gx PATH $HOME/.local/bin $HOME/fvm/default/bin $HOME/.cargo/bin $PATH $GOPATH/bin $HOME/.local/bin/dart-sass $HOME/.local/share/JetBrains/Toolbox/scripts

# Application setup
set -gx GPG_TTY (tty)
set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/keyring/ssh

# fish
set -g fish_key_bindings fish_vi_key_bindings
set -g fish_cursor_insert block

# cat
set -gx BAT_PAGER ""

# Zoxide
if type -q zoxide
    zoxide init fish | source
end

# Python keyring
set -gx PYTHON_KEYRING_BACKEND keyring.backends.fail.Keyring

### Default programs ###

set -gx EDITOR vim
set -gx VISUAL vim

### User info ###

set -gx GITHUB_USER Maxr1998
set -gx MPW_FULLNAME Maxr1998

# Commands to run in interactive sessions can go here
if status is-interactive
    complete -c svim -w vim

    complete -c wget -l content-disposition -d "Use filename from server."

    if type -q fzf
        fzf_key_bindings
    end

    if type -q thefuck
        thefuck --alias | source
    end
end
