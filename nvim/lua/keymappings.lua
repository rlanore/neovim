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
utils.map('n', '<leader>nf', ':Telescope frecency<CR>')
utils.map('n', '<leader>c', ':Telescope git_commits<CR>')
utils.map('n', '<leader>bc', ':Telescope git_bcommits<CR>')

-- LSP mappings
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>lo', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

