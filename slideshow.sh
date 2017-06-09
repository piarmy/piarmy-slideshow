#!/bin/ash

fbi -d /dev/fb0 -T 1 --noverbose --readahead -t 5 images/*.jpg

echo "Keeping container open..."
tail -f /dev/null