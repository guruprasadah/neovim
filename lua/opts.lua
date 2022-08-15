vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.wo.wrap = false
vim.o.termguicolors = true
vim.g.t_co = 256

vim.cmd[[colorscheme gruvbox]]
vim.o.background = "dark"
vim.cmd[[set mouse=a]]

local configs = require'nvim-treesitter.configs'
configs.setup {
  ensure_installed = "cpp",
  highlight = {
    enable = true,
  }
}

local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<Tab>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }

  cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

  require'bufferline'.setup {
  
    animation = true,
    auto_hide = false,
    closable = true,
    clickable = true,
    icons = true,

    icon_separator_active = '▎',
    icon_separator_inactive = '▎',
    icon_close_tab = '',
    icon_close_tab_modified = '●',
    icon_pinned = '車',

    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  
  }

  require "lsp_signature".setup({})
