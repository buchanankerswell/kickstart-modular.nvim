local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'hat0uma/csvview.nvim' }
require('csvview').setup {
  parser = { comments = { '#', '//', '--' } },
  view = {
    display_mode = 'border',
    min_column_width = 5,
    spacing = 0,
  },
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'csv', 'tsv' },
  callback = function()
    vim.keymap.set('n', '<leader>tt', '<cmd>CsvViewToggle<CR>', {
      buffer = true,
      desc = 'Toggle CSV View',
    })
    vim.cmd 'CsvViewEnable'
  end,
})

-- vim: ts=2 sts=2 sw=2 et
