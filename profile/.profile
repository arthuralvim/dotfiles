# Load the exports, functions, aliases and extra dotfiles.

for file in ~/.{aliases,exports,extra,functions,paths,inputrc};
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file
