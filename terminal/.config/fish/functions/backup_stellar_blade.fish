function backup_stellar_blade
    set game_path "$HOME/.local/share/Steam/steamapps/compatdata/3489700/pfx/drive_c/users/steamuser/AppData/Local/SB/"
    tar -czf - -C $game_path --exclude '*.vdf' 'Saved/Config/WindowsNoEditor/' 'Saved/SaveGames/' | ssh iridium "cat - > /ext_backup/iridium/games/saves/Stellar\ Blade/Stellar\ Blade\ (date +%Y-%m-%dT%H:%M%z).tar.gz"
end