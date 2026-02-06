require('lazy').setup({
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.blink-cmp',
  require 'kickstart.plugins.conform',
  require 'kickstart.plugins.csvview',
  require 'kickstart.plugins.gitsigns',
  require 'kickstart.plugins.guess-indent',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.lspconfig',
  require 'kickstart.plugins.mini',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.rose-pine',
  require 'kickstart.plugins.telescope',
  require 'kickstart.plugins.todo-comments',
  require 'kickstart.plugins.treesitter',
  require 'kickstart.plugins.which-key',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
