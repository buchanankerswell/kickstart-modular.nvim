local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'rose-pine/neovim' }
---@diagnostic disable-next-line: missing-fields
require('rose-pine').setup {
  variant = 'auto',
  dark_variant = 'moon',
  styles = {
    comments = { italic = false },
  },
}
vim.cmd.colorscheme 'rose-pine'

-- vim: ts=2 sts=2 sw=2 et
