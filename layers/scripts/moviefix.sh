#!/bin/bash

# This script will look at all the FILES ( not directories ) and create directories to properly define the format Sonarr and Radarr need.
# For Movies, I might have a a bunch of movie files but it needs to be sorted with a movie in each folder to be ingested correctly.
# Ex: Foo.avi will become Foo/Foo.avi

for filepath in ./*; do
    [ -e "$filepath" ] || continue
    filename="${filepath##*/}"
    echo "$filename"
    newdir="${filename%.*}"
    mkdir -p "$newdir"
    mv "$filepath" "$newdir/"
done