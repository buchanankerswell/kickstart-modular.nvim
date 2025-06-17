return {
  'NMAC427/guess-indent.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('guess-indent').setup {
      auto_cmd = true,
      override_editorconfig = false,
    }
  end,
}

-- vim: ts=2 sts=2 sw=2 et
