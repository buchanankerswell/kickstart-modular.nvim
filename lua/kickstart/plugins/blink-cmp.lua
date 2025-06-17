return {
  {
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {},
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'default',
        ['<CR>'] = { 'accept', 'fallback' },
      },
      appearance = {
        highlight_ns = vim.api.nvim_create_namespace 'blink_cmp',
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
        kind_icons = {
          Text = '[txt]',
          Method = '[fn]',
          Function = '[fn]',
          Constructor = '[ctor]',

          Field = '[fld]',
          Variable = '[var]',
          Property = '[prop]',

          Class = '[cls]',
          Interface = '[iface]',
          Struct = '[struct]',
          Module = '[mod]',

          Unit = '[unit]',
          Value = '[val]',
          Enum = '[enum]',
          EnumMember = '[enm]',

          Keyword = '[kw]',
          Constant = '[const]',

          Snippet = '[snip]',
          Color = '[color]',
          File = '[file]',
          Reference = '[ref]',
          Folder = '[dir]',
          Event = '[event]',
          Operator = '[op]',
          TypeParameter = '[type]',
        },
      },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        menu = { scrolloff = 2 },
        list = { selection = { preselect = true, auto_insert = true } },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },
      snippets = { preset = 'luasnip' },
      fuzzy = { implementation = 'lua' },
      signature = { enabled = true },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
