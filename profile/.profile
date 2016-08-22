# Load the exports, functions, aliases and extra dotfiles.

for file in ~/.{aliases,paths,exports,extra,functions}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file
