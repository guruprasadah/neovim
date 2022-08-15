local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')

local packer = require'packer'
local util = require'packer.util'

packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

--- startup and add configure plugins
packer.startup(function()
    local use = use

    use 'nvim-treesitter/nvim-treesitter'
    use 'sheerun/vim-polyglot'

    use 'morhetz/gruvbox'

    use 'neovim/nvim-lspconfig'
    use 'anott03/nvim-lspinstall'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    use 'ms-jpq/chadtree'

    use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
	  use {'junegunn/fzf.vim'}

    use 'glepnir/galaxyline.nvim'
    use 'Avimitin/nerd-galaxyline'

    use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}
    
    use {'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup{} end}

    use 'ray-x/lsp_signature.nvim'
  end
)
