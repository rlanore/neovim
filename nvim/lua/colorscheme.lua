-- colorscheme and lualine config ( status line write in lua )
require('nightfox').load('nightfox')

-- TODO lsp_progress not work
require('lualine').setup{
  options = {
    --theme = 'material-nvim'
    --theme = 'tokyonight'
    --theme = 'onedark'
    theme = 'nightfox'
  },
  tabline = {
    lualine_a = { 'buffers' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'filename' },
    lualine_c = { 'branch', 'lsp_progress' },
    lualine_x = { 'filetype' }
  }
}
