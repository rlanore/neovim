-- Auto install packer if not present
local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

return require('packer').startup(function()
  -- Packer can manage itself
  use {
    'wbthomason/packer.nvim',
    config = function()
      vim.cmd "autocmd BufWritePost init.lua source <afile> | PackerCompile"
    end
  }
  -- Show | for indent
  use { 
    'Yggdroot/indentLine' 
  }
  -- Status bar
  use {
		'shadmansaleh/lualine.nvim',	
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Snippet completion replaced by nvim-coq snippet
  --use 'SirVer/ultisnips'
  --use 'fhill2/telescope-ultisnips.nvim'

  -- Calendar
  use'itchyny/calendar.vim'
  -- More human understanding maximizer
  use'szw/vim-maximizer'
  -- Toogle number and relativenumber on focus
  use 'jeffkreeftmeijer/vim-numbertoggle'
  -- To show color from code. go must be installed
  use {
		'rrethy/vim-hexokinase',  
		run = 'make'
  }
  --Open bowser new tab and render ( :MarkdownPreview )
  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    ft = {"markdown"}
	}

  -- Auto add [ ( {
  use 'jiangmiao/auto-pairs'

  -- Color parentesis and like
  use 'luochen1990/rainbow'
  --let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle"
  
  -- Nice start page
  use 'mhinz/vim-startify'
  
  -- Color first char of word for jump to
  use 'unblevable/quick-scope' 

  -- Load icon
  use 'ryanoasis/vim-devicons'

  -- Some git command from vim
  use 'tpope/vim-fugitive'

  -- Add column with update line
  -- Show git update line into column
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  
  -- Ranger plugin is to navigate some file and show content as same time
  use 'kevinhwang91/rnvimr'

  -- Telescope and extension
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use { 
    'nvim-telescope/telescope-fzf-native.nvim', 
    run = 'make' 
  }
  use {
    "nvim-telescope/telescope-frecency.nvim",
    requires = {"tami5/sqlite.lua"}
  }
	-- TODO install 'nvim-telescope/telescope-media-files.nvim'
  use 'nvim-telescope/telescope-symbols.nvim'
  -- remember yanked
  use "AckslD/nvim-neoclip.lua"

  -- lsp-main
  use 'neovim/nvim-lspconfig'
  -- Add some info from LSP to lualine
  use 'arkav/lualine-lsp-progress'

  -- Completion plugin
  use { 
    'ms-jpq/coq_nvim',
    branch = 'coq'
  }
  use {
    'ms-jpq/coq.artifacts',
    branch = 'artifacts'
  }

  -- colorscheme
  use 'EdenEast/nightfox.nvim'

  -- Keymapping remember
  use {
    'AckslD/nvim-whichkey-setup.lua',
    requires = {'liuchengxu/vim-which-key'},
       
  }

  -- Tree-sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    branch = '0.5-compat'
    --cmd = ':TSUpdate'
  } 

  -- Nvim Explorer
  use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-tree'.setup {} end
  }


end)
