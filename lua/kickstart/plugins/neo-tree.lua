return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
      icon = {
        folder_closed = '[+]',
        folder_open = '[-]',
        folder_empty = '[ ]',
        default = '*',
      },
      modified = {
        symbol = '[M]',
      },
      git_status = {
        symbols = {
          added = '+',
          modified = '~',
          deleted = '-',
          renamed = '»',
          untracked = '?',
          ignored = '!',
          unstaged = '*',
          staged = '✓',
          conflict = '⚠',
        },
      },
    },
    filesystem = {
      follow_current_file = true,
      hijack_netrw = true,
      use_libuv_file_watcher = false,
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
