local wk = require('whichkey_setup')

local keymap = {
    
    --['<CR>'] = {'@q', 'macro q'}, -- setting a special key
    b = 'Buffers',
    d = 'Close buffers',
    bc = 'Buffer commits',
    c = 'Commits',
    o = 'Open Ranger',
    f = 'Open files',
    F = 'Open files from git home',
    r = 'Rg from git root',
    R = 'Rg from git home',
    t = { -- set a nested structure
        name = '+term',
        h = {'<Cmd>:sp|:term<CR>', 'Horiz term'},
        v = {'<Cmd>:vs|:term<CR>', 'Vert term'}
    },
    g = { -- set a nested structure
        name = '+Git',
        a = 'Add',
        s = 'Status',
        c = 'Commits list',
        m = 'Commits'
    },
    -- Redefine lsp as it's coded into on_attach function
    l = { -- set a nested structure
        name = '+lsp',
        a = {'<Cmd>Telescope lsp_code_actions<CR>','Code actions'},
        d = {'<Cmd>Telescope lsp_definitions<CR>','Definitions'},
        h = {'<Cmd>Telescope lsp_documents_diagnostics<CR>','Diagnostics'},
        i = {'<Cmd>Telescope lsp_implementations<CR>','Implementations'},
        --n = {'<Cmd>lua vim.lsp.buf.rename()<CR>','Rename'},
        q = {'<Cmd>Telescope quickfix()<CR>','Quickfix'},
        r = {'<Cmd>Telescope lsp_references<CR>','References'},
        s = {'<Cmd>Telescope lsp_documents_symbols<CR>','Symbols'},
        w = {'<Cmd>Telescope lsp_workspace_diagnostics<CR>','Workspace diagnostics'},
    }
}

wk.register_keymap(' ', keymap)
