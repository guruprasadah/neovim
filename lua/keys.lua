vim.g.mapleader = ' '

local key_map = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
  end
-- fzf ops
key_map('n', '<Leader>f', ':Files<CR>')
key_map('n', '<Leader>g', ':Rg<CR>')
--edit ops
key_map('n', '<Leader>bv', ':vsplit<CR>')
key_map('n', '<Leader>bh', ':hsplit<CR>')
key_map('n', '<Leader>c', 'y')
key_map('n', '<Leader>v', 'p')
--utils
key_map('n', '<Leader>s', ':w<CR>')
key_map('n', '<Leader>c', ':q<CR>')
key_map('n', '<Leader>q', ':qa<CR>')
key_map('n', '<Leader>qqqq', ':qa!<CR>')
--packer
key_map('n', '<Leader><F8>', ':PackerCompile <bar> :PackerInstall <CR>')
