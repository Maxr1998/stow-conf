function uploadserver --description 'Upload the passed file to the import directory of the server.'
    rsync -avcP $argv iridium:/import/
end
