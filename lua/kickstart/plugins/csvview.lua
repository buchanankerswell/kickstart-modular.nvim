return {
  {
    'hat0uma/csvview.nvim',
    ---@module "csvview"
    ---@type CsvView.Options
    opts = {
      parser = { comments = { '#', '//', '--' } },
      view = {
        display_mode = 'border',
        min_column_width = 5,
        spacing = 0,
      },
    },
    cmd = { 'CsvViewEnable', 'CsvViewDisable', 'CsvViewToggle' },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'csv', 'tsv' },
        callback = function()
          -- Toggle keymap
          vim.keymap.set('n', '<leader>tt', '<cmd>CsvViewToggle<CR>', {
            buffer = true,
            desc = 'Toggle CSV View',
          })
          -- Automatically enable the view on open
          vim.cmd 'CsvViewEnable'
        end,
      })
    end,
  },
}
