function backup_nier
    set game_path "$HOME/.local/share/Steam/steamapps/compatdata/1113560/pfx/drive_c/users/steamuser/My Documents/My Games"
    tar -czf - -C $game_path . | ssh iridium "cat - > /ext_backup/iridium/games/saves/NieR:Replicant/NieR:Replicant_(date +%Y-%m-%dT%H:%M%z).tar.gz"
end