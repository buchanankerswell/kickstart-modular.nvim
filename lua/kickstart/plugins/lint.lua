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
      lint.linters.lintr = {
        name = 'lintr',
        cmd = 'Rscript',
        stdin = false,
        args = { '-e', [[lintr::lint(commandArgs(TRUE))]], '--args' },
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

        local args = {
          '--enable=warning,style,performance,portability',
          '--template=gcc',
          '--inline-suppr',
          '--std=' .. ((filetype == 'c') and 'c11' or 'c++17'),
          '--language=' .. language,
          '--quiet',
          '--force',
        }

        local suppressions_file = vim.fn.findfile('.cppcheck-suppressions', '.;')
        if suppressions_file ~= '' then
          table.insert(args, '--suppressions-list=' .. suppressions_file)
        end

        return args
      end
      lint.linters.cppcheck.args = cppcheck_args()
      lint.linters.ruff.args = {
        '--quiet',
        '--format=gnu',
        '--select=E,W,F,I,N,UP,YTT,ANN,S,BLE,B,A,COM,C4,DTZ,ISC,ICN,G,PIE,T20,Q,RSE,RET,SLF,SIM,TID,ARG,PTH,PD,PL,NPY,RUF',
        '--ignore=E501,ANN101,ANN102',
      }
      lint.linters.shellcheck.args = {
        '--format=gcc',
        '--shell=bash',
        '--enable=all',
        '--external-sources',
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
