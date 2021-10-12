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
    theme = 'molokai'
  },
  tabline = {
    lualine_a = {},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
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

--" Load personal plugin
--" PlugInstall vim command to install new plugin
--call plug#begin()
--if has('nvim')
--  " Coc completion tool
--  Plug 'neoclide/coc.nvim', {'branch': 'release'}
--    " Use tab for trigger completion with characters ahead and navigate.
--    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
--    " other plugin before putting this into your config.
--    inoremap <silent><expr> <TAB>
--          \ pumvisible() ? "\<C-n>" :
--          \ <SID>check_back_space() ? "\<TAB>" :
--          \ coc#refresh()
--    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
--    
--    function! s:check_back_space() abort
--      let col = col('.') - 1
--      return !col || getline('.')[col - 1]  =~# '\s'
--    endfunction
--    
--    " Use <c-space> to trigger completion.
--    "nnoremap <silent><expr> <space>c coc#refresh()
--    "inoremap <silent><expr> <c-space> coc#refresh()
--    
--    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
--    " position. Coc only does snippet and additional edit on confirm.
--    " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
--    if exists('*complete_info')
--      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
--    else
--      inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
--    endif
--
--  " Use K to show documentation in preview window.
--  nnoremap <silent> K :call <SID>show_documentation()<CR>
--  
--  function! s:show_documentation()
--    if (index(['vim','help'], &filetype) >= 0)
--      execute 'h '.expand('<cword>')
--    else
--      call CocAction('doHover')
--    endif
--  endfunction
--  
--  " Highlight the symbol and its references when holding the cursor.
--  autocmd CursorHold * silent call CocActionAsync('highlight')
--  
--  augroup mygroup
--    autocmd!
--    " Setup formatexpr specified filetype(s).
--    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
--    " Update signature help on jump placeholder.
--    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
--  augroup end
--  
--  " Map function and class text objects
--  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
--  xmap if <Plug>(coc-funcobj-i)
--  omap if <Plug>(coc-funcobj-i)
--  xmap af <Plug>(coc-funcobj-a)
--  omap af <Plug>(coc-funcobj-a)
--  xmap ic <Plug>(coc-classobj-i)
--  omap ic <Plug>(coc-classobj-i)
--  xmap ac <Plug>(coc-classobj-a)
--  omap ac <Plug>(coc-classobj-a)
--  
--  " Add `:Format` command to format current buffer.
--  command! -nargs=0 Format :call CocAction('format')
--  
--  " Add `:Fold` command to fold current buffer.
--  command! -nargs=? Fold :call     CocAction('fold', <f-args>)
--  
--  " Add `:OR` command for organize imports of the current buffer.
--  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
--  
--  " Add (Neo)Vim's native statusline support.
--  " NOTE: Please see `:h coc-status` for integrations with external plugins that
--  " provide custom statusline: lightline.vim, vim-airline.
--  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
--  
--  " Mappings for CoCList
--  " Show all diagnostics.
--  nnoremap <silent><nowait> <space><space>    :<C-u>CocFzfList<CR>
--  nnoremap <silent><nowait> <space>a  :<C-u>CocFzfList diagnostics<cr>
--  " Manage extensions.
--  nnoremap <silent><nowait> <space>e  :<C-u>CocFzfList extensions<cr>
--  " Show commands.
--  nnoremap <silent><nowait> <space>cc  :<C-u>CocFzfList commands<cr>
--  " Find symbol of current document.
--  nnoremap <silent><nowait> <space>o  :<C-u>CocFzfList outline<cr>
--  " Search workspace symbols.
--  nnoremap <silent><nowait> <space>s  :<C-u>CocFzfList -I symbols<cr>
--  " Do default action for next item.
--  nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
--  " Do default action for previous item.
--  nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
--  " Resume latest coc list.
--  nnoremap <silent><nowait> <space>p  :<C-u>CocFzfListResume<CR>
--
--  nnoremap <space>e :CocCommand explorer<CR>
--
--  let g:coc_explorer_global_presets = {
--  \   'floating': {
--  \     'position': 'floating',
--  \     'open-action-strategy': 'sourceWindow',
--  \   },
--  \   'floatingLeftside': {
--  \     'position': 'floating',
--  \     'floating-position': 'left-center',
--  \     'floating-width': 50,
--  \     'open-action-strategy': 'sourceWindow',
--  \   },
--  \ }
--
--	" Use preset argument to open it
--	nnoremap <space>ef :CocCommand explorer --preset floating<CR>
--	
--	" List all presets
--	nnoremap <space>el :CocList explPresets
--  
--  " Auto install coc extension
--  let g:coc_global_extensions = [
--        \'coc-json',
--        \'coc-word',
--        \'coc-ultisnips',
--        \'coc-spell-checker',
--        \'coc-cspell-dicts',
--        \'coc-snippets',
--        \'coc-marketplace',
--        \'coc-dictionary',
--        \'coc-calc',
--        \'coc-vimlsp',
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
--
--
--" Fuzy finder (:FZF cur dir, :FZF ~. C-T,C-X, C-V ) 
--" Somme command:
--"     :Files [ PATH ]
--"     :Gfiles? ( git status )
--"     :Colors ( change colors themes )
--"     :History: ( Command history )
--"     :History/ ( Search history )
--"     :Lines [Query] ( Line in load buffers )
--"     :Snippets ( show snippets from utilSnips )
--"Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
--Plug 'junegunn/fzf'
--Plug 'junegunn/fzf.vim'
--  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }
--  nmap <leader>f :Root<CR>:Files<CR>
--  nmap <leader>F :Rgitcls<CR>:Files<CR>
--  "nmap <leader>g :GFiles<CR>
--  "nmap <leader>c :Commits<CR>
--  "nmap <leader>bc :BCommits<CR>
--  nmap <leader>r :Root<CR>:Rg<CR>
--  nmap <leader>R :Rgitcls<CR>:Rg<CR><CR>
--  nmap <leader>b :Buffers<CR>
--  nmap <leader>d :bd<CR>
--  nmap <leader>df :windo diffthis<CR>
--  nmap <leader>k :!docker cp % kubectl:/tmp<CR><CR>
--
--" Use fzf instead of coc list builtin
--Plug 'antoinemadec/coc-fzf'
--
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
