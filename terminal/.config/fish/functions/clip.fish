function clip
    set filename $argv[1]
    cat "$filename" | xsel --clipboard
end
