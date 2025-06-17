return {
  {
    'rose-pine/neovim',
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('rose-pine').setup {
        variant = 'auto',
        dark_variant = 'moon',
        styles = {
          comments = { italic = false },
        },
      }
      vim.cmd.colorscheme 'rose-pine'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
