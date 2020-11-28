function vobrip --description 'Transcodes a VOB to H.265'
    if test (count $argv) -ne 1
        echo "Illegal use, requires a VOB file argument"
    end

    set input $argv[1]
    set output (string split -r -m 1 . "$input")[1].out.mkv
    echo "Encoding $input to $output"
    ffmpeg -i "$input" -vf yadif=1 -c:v libx265 -preset veryslow -crf 18 -c:a flac "$output"
end
