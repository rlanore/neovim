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

-- Close buffer
utils.map('n', '<leader>d', ':bd<CR>')
-- Show buffer diff
utils.map('n', '<leader>df', ':windo diffthis<CR>')

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
-- Git mappings
utils.map('n', '<leader>gs', ':Git<CR>')
utils.map('n', '<leader>ga', ':Gwrite<CR>')
utils.map('n', '<leader>gm', ':Gcommit<CR>')
utils.map('n', '<leader>gc', ':Telescope git_commits<CR>')
utils.map('n', '<leader>gbc', ':Telescope git_bcommits<CR>')

-- Set rnvimr ( file navigator ) shortcuts
utils.map('n', '<leader>o', ':RnvimrToggle<CR>')

-- Telescope mappings
utils.map('n', '<leader>f', ':Root<CR>:Telescope find_files<CR>')
utils.map('n', '<leader>F', ':Rgitcls<CR>:Telescope find_files<CR>')
utils.map('n', '<leader>r', ':Root<CR>:Telescope live_grep<CR>')
utils.map('n', '<leader>R', ':Rgitcls<CR>:Telescope live_grep<CR>')
utils.map('n', '<leader>b', ':Telescope buffers<CR>')


-- Telescope vim bindings
utils.map('n', '<leader>vc', ':Telescope commands<CR>')
utils.map('n', '<leader>vk', ':Telescope keymaps<CR>')

-- LSP bindings
utils.map('n', '<leader>la', ':Telescope lsp_code_actions<CR>')
utils.map('n', '<leader>ld', ':Telescope lsp_definitions<CR>')
utils.map('n', '<leader>lh', ':Telescope lsp_documents_diagnostics<CR>')
utils.map('n', '<leader>li', ':Telescope lsp_implementations<CR>')
utils.map('n', '<leader>ln', '<cmd>lua vim.lsp.buf.rename()<CR>')
utils.map('n', '<leader>lq', ':Telescope quickfix<CR>')
utils.map('n', '<leader>lr', ':Telescope lsp_references<CR>')
utils.map('n', '<leader>ls', ':Telescope lsp_documents_symbols<CR>')
utils.map('n', '<leader>lw', ':Telescope lsp_workspace_diagnostics<CR>')

