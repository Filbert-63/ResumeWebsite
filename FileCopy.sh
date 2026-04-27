#!/bin/bash

# Define source and destination directories
src_dir="/home/remypinto/ResumeWebsite/html"
dst_dir="/var/www/html"

# Copy files recursively (including subdirectories)
# -r: recursive, -v: verbose (shows progress)
cp -rv "$src_dir"/. "$dst_dir"/
