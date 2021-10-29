" All dictionary for which_key_map
    \ 'o'  : 'Open ranger'                         ,
    \ 'r'  : 'Rg from git root'                    ,
    \ 'R'  : 'Rg from git home'                    ,
    \ }

let g:which_key_map['t'] = {
    \ 'name' : '+term' ,
    \ 'h'  : [ ':sp|:term', 'Horiz term' ]       ,
    \ 'v'  : [ ':vs|:term', 'Vert term' ]       ,
    \ }

let g:which_key_map['c'] = {
    \ 'name' : '+coc' ,
    \ 'a'  :  ['<Plug>(coc-codeaction-selected)' , 'CocAction cursor']       ,
    \ 'ac' : ['CocAction'                        , 'CocAction buffer']       ,
    \ 'd'  : ['<Plug>(coc-definition)'           , 'Jump definition']        ,
    \ 'e'  : ['<Plug>(coc-rename)'               , 'Coc rename']             ,
    \ 'f'  : ['<Plug>(coc-fix-current)'          , 'Coc quick fix']          ,
    \ 'o'  : ['<Plug>(coc-format-selected)'      , 'Coc format']             ,
    \ 'r'  : ['<Plug>(coc-references)'           , 'Jump references']        ,
    \ 'n'  : ['<Plug>(coc-diagnostic-next)'      , 'Coc diag next']          ,
    \ 'p'  : ['<Plug>(coc-diagnostic-prev)'      , 'Coc diag previous']      ,
    \ 's'  : ['<Plug>(coc-range-select)'         , 'Coc range select']       ,
    \ }

let g:which_key_map['g'] = {
    \ 'name' : '+git' ,
    \ 's'   : [':Git' , 'Status'                 ]                           ,
    \ 'a'   : [':Gwrite'     , 'Add'             ]                           ,
    \ 'b'   : [':BCommits'   , 'Commits'         ]                           ,
    \ 'd'   : [':Git diff'   , 'Diff'            ]                           ,
    \ 'c'   : [':Gcommit'    , 'Commits'         ]                           ,
    \ 'l'  :  [':Commits'    ,'Git list commit'  ]                           ,
    \ 'p'  :  [':Gpush'    ,'Git list commit'  ]                           ,
    \ 'u'  :  [':Gpull'    ,'Git list commit'  ]                           ,
    \ }

let g:which_key_map['w'] = {
    \ 'name' : '+windows' ,
    \ 'w' : ['<C-W>w'           , 'other-window']          ,
    \ 'h' : ['<C-h>'            , 'window-left']           ,
    \ 'j' : ['<C-j>'            , 'window-below']          ,
    \ 'l' : ['<C-l>'            , 'window-right']          ,
    \ 'k' : ['<C-k>'            , 'window-up']             ,
    \ '=' : ['<C-W>='           , 'balance-window']        ,
    \ 'z' : ['MaximizerToggle'  , 'Maximize window']       ,
    \ }
