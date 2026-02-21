#!/usr/bin/env bash

# Configuration
HOME_DIR="$HOME"
MAX_FILE_RESULTS=100
WEB_SEARCH_ENGINE="https://www.google.com/search?q="

# Prompt user in wofi drun (apps)
query=$(wofi --show drun -d -p "Search >")

# Exit if empty
[[ -z "$query" ]] && exit

# Detect math expressions
# Numbers, operators, parentheses, e, pi, %, spaces
if [[ $query =~ ^[0-9\.\+\-\*\/\^\(\)%ep-]+$ ]]; then
    result=$(qalc -t "$query")
    echo "$query = $result" | wofi -d -p "Calculator"
    exit
fi

# Search for files
file=$(fd --hidden --follow --exclude .git --max-results $MAX_FILE_RESULTS "$query" "$HOME_DIR" \
        | wofi -d -p "Files matching '$query' >")

if [[ -n "$file" ]]; then
    xdg-open "$file"
    exit
fi

# Attempt to launch app
gtk-laumch "$query" 2>/dev/null && exit

# Web search fallback
xdg-open "${WEB_SEARCH_ENGINE}${query// /+}"
