return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      local ensure_installed = {
        'bash',
        'zsh',
        'cpp',
        'python',
        'r',
        'julia',
        'lua',
        'luadoc',
        'vim',
        'vimdoc',
        'diff',
        'html',
        'css',
        'markdown',
        'markdown_inline',
        'toml',
        'yaml',
        'json',
        'latex',
        'bibtex',
        'vim',
        'tsv',
        'csv',
        'make',
        'cmake',
      }
      require('nvim-treesitter').install(ensure_installed)
      vim.list_extend(ensure_installed, {
        'bib',
        'tex'
      })
      vim.api.nvim_create_autocmd('FileType', {
        pattern = ensure_installed,
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
