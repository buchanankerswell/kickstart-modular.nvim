-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Append line without jumping to end
vim.keymap.set('n', 'J', 'mzJ`z')

-- Center jump scroll
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Center search results
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Disable legacy Q command
vim.keymap.set('n', 'Q', '<nop>')

-- Paste without clobbering
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste (no clobber)' })

-- Yank to clipboard instead of buffer
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank (no buffer)' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank Line (no buffer)' })

-- Delete without adding to buffer
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete (no buffer)' })

-- Smart search and replace under cursor
vim.keymap.set('n', '<leader>S', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Search & Replace' })

-- Write file
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { silent = true, desc = 'Write Buffer' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Buffer Quickfix List' })

-- Toggle Spellcheck
vim.keymap.set('n', '<leader>ts', '<cmd>setlocal spell!<CR>', { desc = 'Toggle Spell Check' })

-- vim: ts=2 sts=2 sw=2 et
