# Default programs
set -gx EDITOR vim
set -gx VISUAL vim

complete -c svim -w vim

thefuck --alias | source

set -gx PAGER most
set -gx BAT_PAGER ""

# Environment
set -gx PATH $HOME/.local/bin $HOME/.local/bin/dart-sass $PATH

set -gx ANDROID_SDK_ROOT $HOME/Development/sdk/
set -gx NDK $HOME/Development/sdk/ndk-bundle/
set -gx ANDROID_HVPROTO ddm

set -gx GOPATH $HOME/Apps/go/

# User info
export MPW_FULLNAME=Maxr1998

set GITHUB_USER Maxr1998

fzf_key_bindings

# git autocompletion (by timm0e)
#complete -c git -n "string match -r '^git clone.*' (commandline) > /dev/null ; echo $status" -a '(curl -Ls https://api.github.com/users/$GITHUB_USER/repos|jq ".[]|.clone_url" -c|string replace -a "\"" "")'

