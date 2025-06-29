### Environment ###

# Tools
set -gx ANDROID_HOME $HOME/Development/sdk
set -gx NDK_BUNDLE $ANDROID_HOME/ndk-bundle
set -gx NDK_ROOT $ANDROID_HOME/ndk/21.4.7075529
set -gx ANDROID_HVPROTO ddm

set -gx GOPATH $HOME/Apps/go

# Path
set -gx PATH $HOME/.local/bin $HOME/.cargo/bin $PATH $GOPATH/bin $HOME/.local/bin/dart-sass $HOME/.local/share/JetBrains/Toolbox/scripts

# Application setup
set -gx GPG_TTY (tty)
set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/keyring/ssh

# fish
set -U fish_cursor_insert block

# Zoxide
if type -q zoxide
    zoxide init fish | source
end

# Python + Pyenv
set -gx PYTHON_KEYRING_BACKEND keyring.backends.fail.Keyring

if type -q pyenv
    pyenv init - | source
end

### Default programs ###

set -gx EDITOR vim
set -gx VISUAL vim

set -gx BAT_PAGER ""

### User info ###

export MPW_FULLNAME=Maxr1998

set GITHUB_USER Maxr1998

# Commands to run in interactive sessions can go here
if status is-interactive
    complete -c svim -w vim

    if type -q fzf
        fzf_key_bindings
    end

    if type -q thefuck
        thefuck --alias | source
    end
end
