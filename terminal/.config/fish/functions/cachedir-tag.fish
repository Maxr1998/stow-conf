function cachedir-tag --description 'Tag folder as cache dir'
    if test (count $argv) -eq 1
        set directory (realpath $argv[1])
    else
        set directory (realpath .)
    end

    if test ! -d $directory
        echo "Not a directory"
        return
    end

    echo "Tagging $directory"
    printf 'Signature: 8a477f597d28d172789f06886806bc55\n' > $directory/CACHEDIR.TAG
end
