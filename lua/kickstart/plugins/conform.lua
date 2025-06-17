return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = 'n',
        desc = 'Format Buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = false,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        cpp = { 'clang-format' },
        c = { 'clang-format' },
        r = { 'styler' },
        sh = { 'shfmt' },
        bash = { 'shfmt' },
        markdown = { 'prettier' },
        yaml = { 'prettier' },
        json = { 'prettier' },
        toml = { 'prettier' },
      },
      formatters = {
        shfmt = {
          prepend_args = { '-i', '2', '-ci' },
        },
        prettier = {
          prepend_args = { '--prose-wrap', 'preserve', '--print-width', '150' },
        },
        black = {
          prepend_args = { '--line-length', '150' },
        },
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
