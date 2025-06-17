return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    close_if_last_window = true,
    popup_border_style = 'rounded',
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
      container = {
        enable_character_fade = true,
      },
      indent = {
        indent_size = 2,
        padding = 1,
        with_markers = true,
        indent_marker = '|',
        last_indent_marker = '`',
        highlight = 'NeoTreeIndentMarker',
        with_expanders = nil,
        expander_collapsed = '[+]',
        expander_expanded = '[-]',
        expander_highlight = 'NeoTreeExpander',
      },
      icon = {
        folder_closed = '[+]',
        folder_open = '[-]',
        folder_empty = '[ ]',
        folder_empty_open = '[ ]',
        default = '*',
        highlight = 'NeoTreeFileIcon',
      },
      modified = {
        symbol = '[M]',
        highlight = 'NeoTreeModified',
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = 'NeoTreeFileName',
      },
      git_status = {
        symbols = {
          added = '+',
          modified = '~',
          deleted = '-',
          renamed = '>',
          untracked = '?',
          ignored = '!',
          unstaged = 'u',
          staged = 's',
          conflict = 'x',
        },
      },
      file_size = {
        enabled = true,
        required_width = 64,
      },
      type = {
        enabled = true,
        required_width = 122,
      },
      last_modified = {
        enabled = true,
        required_width = 88,
      },
      created = {
        enabled = true,
        required_width = 110,
      },
      symlink_target = {
        enabled = false,
      },
    },
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
      filtered_items = {
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_hidden = true,
        hide_by_name = {
          '.DS_Store',
        },
        hide_by_pattern = {},
      },
    },
    window = {
      position = 'left',
      width = 40,
    },
  },
}
