return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        python = { 'ruff' },
        cpp = { 'cppcheck' },
        c = { 'cppcheck' },
        r = { 'lintr' },
        sh = { 'shellcheck' },
        bash = { 'shellcheck' },
        markdown = { 'markdownlint' },
      }
      lint.linters.ruff.args = {
        '--quiet',
        '--format=text',
      }
      lint.linters.cppcheck.args = {
        '--enable=warning,style,performance,portability',
        '--template=gcc',
        '--suppressions-list=' .. vim.fn.expand '~/.config/nvim/cppcheck-suppressions.txt',
        '--inline-suppr',
      }
      lint.linters.shellcheck.args = {
        '--format=gcc',
        '--enable=all',
      }
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          if vim.bo.modifiable then
            lint.try_lint()
          end
        end,
      })
      vim.keymap.set('n', '<leader>l', function()
        lint.try_lint()
      end, { desc = 'Trigger linting for current file' })
    end,
  },
}
