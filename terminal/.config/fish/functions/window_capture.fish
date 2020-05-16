function window_capture --description 'Create screenshot of a window and copy it to clipboard'
    import -window (xwininfo | grep "Window id" | awk '{print $4}') png:- | xclip -selection clipboard -t image/png
    notify-send 'Copied to clipboard'
end
