#!/usr/bin/env sh

if [[ ! -d "~/Image" ]]; then
  mkdir -p ~/Image
fi

imagepath="$HOME/Image/bing-wallpaper.jpg"
# urlpath=$( \
# curl "https://www.bing.com/HPImageArchive.aspx?format=rss&idx=0&n=1&mkt=en-US" \
# | xmllint --xpath "/rss/channel/item/link/text()" - \
# | sed 's/1366x768/1920x1080/g' \
# )
# curl "https://www.bing.com$urlpath" -o $imagepath
feh --bg-fill $imagepath


