#!/usr/bin/bash


function syncit() {
    file1=$1
    file2=$2

    if [ -f "$file1" ] && [ -f "$file2" ]; then
        diff -q "$file1" "$file2" >/dev/null
        if [ $? -eq 0 ]; then
            echo "$file1 和 $file2 文件相同"
            return 0
        else
            echo "文件不同，备份后同步 $file2"
            cp $file1 $file2
        fi
    else
        echo "其中一个或两个文件不存在"
        return 2
    fi
}

syncit ~/.config/nvim/init.lua ./init.lua

syncit ~/.config/nvim/lua/options.lua ./lua/options.lua
syncit ~/.config/nvim/lua/plugins.lua ./lua/plugins.lua
