#!/usr/bin/env bash
# Terminate already running bar instances
killall -qw picom

# Launch picom
picom --config ~/.config/picom/picom.conf --experimental-backend -b

echo "Picom launched..."
