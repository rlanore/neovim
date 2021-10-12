local utils = require('utils')
--utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights

--More faster pane move
utils.map( 'i', '<C-h>', '<C-w>h')
utils.map( 'i', '<C-j>', '<C-w>j')
utils.map( 'i', '<C-k>', '<C-w>k')
utils.map( 'i', '<C-l>', '<C-w>l')

utils.map( 'n', '<C-h>', '<C-w>h')
utils.map( 'n', '<C-j>', '<C-w>j')
utils.map( 'n', '<C-k>', '<C-w>k')
utils.map( 'n', '<C-l>', '<C-w>l')

-- TAB in general mode will move to text buffer
utils.map( 'n',   '<silent><TAB>', ':bnext<CR>' )
-- SHIFT-TAB will go back
utils.map( 'n',   '<silent><S-TAB>', ':bprevious<CR>' )
