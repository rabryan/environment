#!/bin/bash
# use to make ctags, cscope and taghighlight files
# if you want to provide a root directory for your code
# that is different from the calling directory, use
# an additional parameter when you call the script

if [ -n "$1" ]; then
    SRC_DIR=$(pwd)/$1
    echo "SRC_DIR set to $SRC_DIR"
else
    SRC_DIR=$(pwd)
fi

if [ "$OS" = "windows" ]; then
    CTAGS=ctags
    TAGHL=~/vimfiles/bundle/taghighlight/plugin/TagHighlight/TagHighlight.py
else
    CTAGS=ctags
    TAGHL=~/.vim/bundle/taghighlight/plugin/TagHighlight/TagHighlight.py
fi

if hash cscope 2>/dev/null; then
    echo "Write cscope files list"
    rm -f $SRC_DIR/cscope.files $SRC_DIR/cscope.out
    cd $SRC_DIR && echo "$(find . -name "*.[ch]")" > cscope.files
    cd $SRC_DIR && echo "$(find . -name "*.vhd")" >> cscope.files
    cd $SRC_DIR && echo "$(find . -name "*.py")" >> cscope.files

    echo "Make cscope database"
    cd $SRC_DIR && cscope -Rkb -i cscope.files
fi

if hash $CTAGS 2>/dev/null; then
    echo "Make ctags list"
    rm -f $SRC_DIR/tags
    cd $SRC_DIR && $CTAGS -R --exclude="*~" --exclude=".git"
fi

if [ -e $TAGHL ]; then
    echo "Make taghighlight files"
    rm -f $SRC_DIR/types_*.taghl
    cd $SRC_DIR && python $TAGHL --ctags-file tags --source-root .
fi
