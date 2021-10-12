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
utils.map( 'n', '<TAB>', ':bnext<CR>' )
-- SHIFT-TAB will go back
utils.map( 'n', '<S-TAB>', ':bprevious<CR>' )

utils.map('n', '<C-w>z', ':MaximizerToggle<CR>')

-- Some git vim-fugitive shortcuts
--  :Gwrite = git add 
--  :Gcommit 
--  :Gpush
--  :Git = git status
utils.map('n', '<leader>g', ':Git<CR>')
utils.map('n', '<leader>ga', ':Gwrite<CR>')
utils.map('n', '<leader>gc', ':Git commit<CR>')

-- Set rnvimr ( file navigator ) shortcuts
utils.map('n', '<leader>o', ':RnvimrToggle<CR>')

-- Telescope mappings
utils.map('n', '<leader>f', ':Root<CR>:Telescope find_files<CR>')
utils.map('n', '<leader>F', ':Rgitcls<CR>:Telescope find_files<CR>')
utils.map('n', '<leader>r', ':Root<CR>:Telescope live_grep<CR>')
utils.map('n', '<leader>R', ':Rgitcls<CR>:Telescope live_grep<CR>')
utils.map('n', '<leader>b', ':Telescope buffers<CR>')
utils.map('n', '<leader>nc', ':Telescope commands<CR>')
utils.map('n', '<leader>nk', ':Telescope keymaps<CR>')
utils.map('n', '<leader>c', ':Telescope git_commits<CR>')
utils.map('n', '<leader>bc', ':Telescope git_bcommits<CR>')

--utils.map('n', '<leader>', ':<CR>')
--utils.map('n', '<leader>', ':<CR>')
--utils.map('n', '<leader>', ':<CR>')
--utils.map('n', '<leader>', ':<CR>')

