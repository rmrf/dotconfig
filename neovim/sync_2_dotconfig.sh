#!/usr/bin/bash

rsync ~/.config/nvim/init.lua ./init.lua
rsync -av ~/.config/nvim/lua/ ./lua/
