local utils = require('utils')

local cmd = vim.cmd
local indent = 2 

cmd 'syntax enable'
cmd 'filetype plugin indent on'
-- Set for tree-sitter
cmd 'set foldmethod=expr'
cmd 'set foldexpr=nvim_treesitter#foldexpr()'

-- Set global settings
-- o = global
-- b = buffer
-- w = window
utils.opt( 'o', 'hidden', true )
utils.opt( 'o', 'title', true )
utils.opt( 'o', 'compatible', false )
utils.opt( 'o', 'mouse', 'a' )
utils.opt( 'o', 'showcmd', true )
utils.opt( 'o', 'showmatch', true )
utils.opt( 'o', 'ignorecase', true )
utils.opt( 'o', 'timeoutlen', 500 )
utils.opt( 'o', 'splitbelow', true )
utils.opt( 'o', 'splitright', true )
utils.opt( 'o', 'autochdir', true )
utils.opt( 'o', 'clipboard', 'unnamed')
utils.opt( 'o', 'updatetime', 500)
utils.opt( 'o', 'pastetoggle', '<F4>')
--utils.opt( 'o', 'termguicolors', true)
utils.opt( 'o', 'showmode', false ) -- Don't show replaced by airline status

vim.opt.iskeyword:append("-")

-- This is mandatory vim-numbertoggle plugins
utils.opt( 'w', 'number', true )
utils.opt( 'w', 'relativenumber', true )

utils.opt( 'b', 'tabstop', 2 )
utils.opt( 'b', 'shiftwidth', 2 )
utils.opt( 'b', 'expandtab', true )


