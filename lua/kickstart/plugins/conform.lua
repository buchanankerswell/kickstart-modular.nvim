local function gh(repo) return 'https://github.com/' .. repo end

-- [[ Formatting ]]
vim.pack.add { gh 'stevearc/conform.nvim' }
require('conform').setup {
  notify_on_error = false,
  format_on_save = false,
  default_format_opts = {
    lsp_format = 'fallback', -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
  },
  -- You can also specify external formatters in here.
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'isort', 'black' },
    cpp = { 'clang-format' },
    c = { 'clang-format' },
    r = { 'styler' },
    sh = { 'shfmt' },
    bash = { 'shfmt' },
    markdown = { 'prettier' },
    latex = { 'latexindent' },
  },
  formatters = {
    shfmt = {
      prepend_args = { '-i', '2', '-ci', '-ln', 'bash' },
    },
    prettier = {
      prepend_args = { '--prose-wrap', 'preserve', '--print-width', '150' },
    },
    black = {
      prepend_args = { '--line-length', '150' },
    },
    styler = {
      prepend_args = function()
        return {
          '--width',
          '150',
        }
      end,
    },
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>f', function() require('conform').format { async = true } end, { desc = '[F]ormat buffer' })

-- vim: ts=2 sts=2 sw=2 et
