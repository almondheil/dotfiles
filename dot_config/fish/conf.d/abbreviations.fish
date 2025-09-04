# abbreviations are like aliases only not.
# they expand when you press enter in the command line.

# replace more dots with more levels of parent dir, anywhere in the command
abbr --add --position anywhere -- ... ../..
abbr --add --position anywhere -- .... ../../..
abbr --add --position anywhere -- ..... ../../../..
