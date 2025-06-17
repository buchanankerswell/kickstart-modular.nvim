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
        yaml = { 'prettier' },
        json = { 'prettier' },
        toml = { 'prettier' },
      }
      lint.linters.lintr = {
        name = 'lintr',
        cmd = 'Rscript',
        stdin = false,
        args = {
          '-e',
          [[lintr::lint(commandArgs(TRUE))]],
          '--args',
        },
        stream = 'stdout',
        ignore_exitcode = true,
        parser = require('lint.parser').from_errorformat('%f:%l:%c: %m', {
          source = 'lintr',
          severity = vim.diagnostic.severity.WARN,
        }),
      }
      local function cppcheck_args()
        local filetype = vim.bo.filetype
        local language = (filetype == 'c') and 'c' or 'c++'

        return {
          '--enable=warning,style,performance,portability',
          '--template=gcc',
          '--suppressions-list=' .. vim.fn.expand '~/.config/nvim/cppcheck-suppressions.txt',
          '--inline-suppr',
          '--std=' .. ((filetype == 'c') and 'c11' or 'c++17'),
          '--language=' .. language,
          '--quiet',
          '--force',
        }
      end
      lint.linters.cppcheck.args = cppcheck_args()
      lint.linters.ruff.args = {
        '--quiet',
        '--format=gnu',
        '--select=ALL',
        '--ignore=E501',
      }
      lint.linters.shellcheck.args = {
        '--format=gcc',
        '--shell=bash',
        '--enable=all',
        '--external-sources',
      }
      lint.linters.prettier = {
        name = 'prettier',
        cmd = 'prettier',
        stdin = true,
        args = { '--stdin-filepath', '%filepath', '--prose-wrap', 'preserve', '--print-width', '150' },
        stream = 'stdout',
        ignore_exitcode = false,
        parser = require('lint.parser').from_errorformat('%f:%l:%c: %m', {
          source = 'prettier',
          severity = vim.diagnostic.severity.WARN,
        }),
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
      end, { desc = 'Lint Buffer' })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
