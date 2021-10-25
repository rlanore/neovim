--/* cSpell:disable */
local cmd = vim.cmd

-- Change leader key (default as \)
vim.g.mapleader = ' '

-- Key mappings
require('keymappings')

-- Plugins
require('plugins')

-- Settings
require('settings')

-- Color and style lualine
require('colorscheme')

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

require('gitsigns').setup{
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 500,
  },
}

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
--require('telescope').load_extension('ultisnips')
--vim.api.nvim_command('packadd telescope-ultisnips.nvim')

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

-- autostart coq completion plugin
vim.g.coq_settings = { 
  keymap = {
    jump_to_mark = "<c-n>",
    recommended = false,
  },
  auto_start = 'shut-up'
}
local servers = { 
  'bashls', 
  'jedi_language_server', 
  'jsonls',
  'dockerls',
  'yamlls',
  'tsserver',
  'solargraph'
}
local coq = require('coq')
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    coq.lsp_ensure_capabilities({})
  }
end

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}

require('nvim-tree').setup{}

--  " Auto install coc extension
--  let g:coc_global_extensions = [
--        \'coc-word',
--        \'coc-spell-checker',
--        \'coc-cspell-dicts',
--        \'coc-dictionary',
--        \'coc-calc',
--        \'coc-explorer',
--        \'coc-markdownlint'
--        \]
--endif
--

require("whichkey_setup").config{
    hide_statusline = true,
    default_keymap_settings = {
        silent=true,
        noremap=true,
    },
    default_mode = 'n',
}
require('wichkey_map')

--" Exit terminal Mode
--"tnoremap <C-Space> <C-\><C-N>
--"tnoremap <C-@> <C-\><C-N>
--tnoremap <Esc> <C-\><C-n>:call coc#float#close_all()<CR>
--"tnoremap <Esc> :call coc#float#close_all() <CR>

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
