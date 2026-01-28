return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
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
        'tsv',
        'csv',
        'markdown',
        'markdown_inline',
        'toml',
        'yaml',
        'json',
        'latex',
        'bibtex',
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
