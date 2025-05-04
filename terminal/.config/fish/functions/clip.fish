function clip
    set filename $argv[1]
    switch $XDG_SESSION_TYPE
        case wayland
            cat "$filename" | wl-copy
        case x11
            cat "$filename" | xsel --clipboard
        case '*'
            echo "Unknown session type $XDG_SESSION_TYPE"
    end
end
