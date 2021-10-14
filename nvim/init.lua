--/* cSpell:disable */
local cmd = vim.cmd
-- Paste into command line: Ctrl+r+0
-- Change leader key (default as \)
vim.g.mapleader = ' '

-- Key mappings
require('keymappings')

-- Plugins
require('plugins')

-- Settings
require('settings')

-- Set vim-hexokinase options
vim.g.Hexokinase_highlighters = { 'backgroundfull' }
vim.g.Hexokinase_optInPatterns = {
  'full_hex', 'rgb', 'rgba', 'hsl', 'hsla', 'colour_names'
}

-- To workarround of tab use into coc plugin
vim.g.UltiSnipsExpandTrigger = "<nop>"

vim.g.calendar_week_number=1

-- Tell markdownPreview to use qutebrowser
vim.g.mkdp_browser = 'qutebrowser'

-- Set active color parentesis
vim.g.rainbow_active = 1

-- Set quick-scope option
vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
cmd [[highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline]]
cmd [[highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline]]

-- Load vim-devicons
vim.g.webdevicons_enable = 1
vim.g.webdevicons_enable_startify = 1

-- Open file in last position
cmd [[autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
]]

-- lualine config ( status line write in lua )
require('lualine').setup{
  options = {
    --theme = 'molokai'
    theme = 'gruvbox'
  },
  tabline = {
    lualine_a = { 'lsp_progress' },
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'filename' },
    lualine_c = { 'branch', 'lsp_progress' }
  }
}

-- AirLine config
--vim.g.airline_powerline_fonts = 1
--vim.g.airline#extensions#tabline#enabled = 1
--vim.g.airline_theme='molokai'
--"let g:airline_theme='deus'
--"let g:airline_theme='onedark'
--"let g:airline_theme='monokai'
--

-- Set rnvimr option
  -- Use ranger when open dir with vim
vim.g.rnvimr_ex_enable = 1
  -- Make Ranger to be hidden after picking a file
vim.g.rnvimr_pick_enable = 1

-- Set auto insert and number on terminal mode
cmd [[autocmd TermOpen * startinsert ]]
cmd [[ augroup TerminalStuff
    au! 
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup END
]]

-- Load telescope extension
require('telescope').load_extension('fzf')
require('telescope').load_extension("frecency")
require('telescope').load_extension('neoclip')

require('telescope').setup {
  extensions = {
    frecency = {
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = {"*.git/*", "*/tmp/*"},
      disable_devicons = false,
      workspaces = {
        ["conf"]    = "/home/rlanore/.config",
        ["git"] = "/home/rlanore/Documents/git",
      }
    }
  },
}

-- neoclip remember yank and use telescope to use it
-- TODO persistant storage not work: https://github.com/AckslD/nvim-neoclip.lua/pull/20
require('neoclip').setup({
  history = 1000,
  enable_persistant_history = true,
})

-- Enable language server
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local nvim_lsp = require('lspconfig')
local coq = require('coq')
local servers = { 'bashls', 'jedi_language_server', 'jsonls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    coq.lsp_ensure_capabilities({
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    })
  }
end

--  " Auto install coc extension
--  let g:coc_global_extensions = [
--        \'coc-json',
--        \'coc-word',
--        \'coc-spell-checker',
--        \'coc-cspell-dicts',
--        \'coc-snippets',
--        \'coc-dictionary',
--        \'coc-calc',
--        \'coc-yaml',
--        \'coc-tsserver',
--        \'coc-solargraph',
--        \'coc-sh',
--        \'coc-python',
--        \'coc-docker',
--        \'coc-git',
--        \'coc-explorer',
--        \'coc-markdownlint'
--        \]
--endif
--
--" Vim key reminder ( active on demand )
--" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
--"Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
--Plug 'liuchengxu/vim-which-key'
--  autocmd VimEnter * call which_key#register(' ', "g:which_key_map")
--  " Reminder vim key bindings
--  nnoremap <silent> <leader> :<c-u>WhichKey ' '<CR>
--  " Hide status bar when display keybinding 
--  autocmd! FileType which_key
--  autocmd  FileType which_key set laststatus=0 noshowmode noruler
--    \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
--  source ~/.vim/which_key_dict.vim
--
--" Logstash highlight
--Plug 'robbles/logstash.vim'
--
--
--call plug#end()
--
--" Use emoji-fzf and fzf to fuzzy-search for emoji, and insert the result
--function! InsertEmoji(emoji)
--    let @a = system('cut -d " " -f 1 | emoji-fzf get', a:emoji)
--    normal! "agP
--endfunction
--
--command! -bang Emoj
--  \ call fzf#run({
--      \ 'source': 'emoji-fzf preview',
--      \ 'options': '--preview ''emoji-fzf get --name {1}''',
--      \ 'sink': function('InsertEmoji')
--      \ })
--" Ctrl-e in normal and insert mode will open the emoji picker.
--" Unfortunately doesn't bring you back to insert mode 😕
--map <C-e> :Emoj<CR>
--imap <C-e> <C-o><C-e>
--
--nmap <LeftMouse> <nop>
--imap <LeftMouse> <nop>
--nmap <RightMouse> <nop>
--imap <RightMouse> <nop>
--
--highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
--"highlight Pmenu ctermfg=253 ctermbg=67 gui=bold guifg=#f8f8f0 guibg=#465457
--highlight Pmenu ctermfg=253 ctermbg=67 guifg=#f8f8f0 guibg=#465457
--"highlight Search ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
--highlight Search cterm=bold ctermfg=253 ctermbg=67 gui=bold guifg=#f8f8f0 guibg=#465457
--"highlight DiffChange ctermbg=5 guibg=
--
--" Exit terminal Mode
--"tnoremap <C-Space> <C-\><C-N>
--"tnoremap <C-@> <C-\><C-N>
--tnoremap <Esc> <C-\><C-n>:call coc#float#close_all()<CR>
--"tnoremap <Esc> :call coc#float#close_all() <CR>
--
--
--
--" Debug
--"let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_py3_debug.log"
--"let $NVIM_RUBY_LOG_FILE ="/tmp/nvim_ruby_debug.log"
--"let $NVIM_PYTHON_LOG_LEVEL="DEBUG"
--"let $NVIM_RUBY_LOG_LEVEL="DEBUG"
--
--" disable autocmd to add some char when begin write into insert mode
--"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
--au BufRead,BufNew * set tabstop=2 shiftwidth=2 expandtab
--au BufRead,BufNew *.heat set filetype=yaml
--
--
