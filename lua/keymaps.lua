vim.keymap.set('n', '<leader>w', ':w!<CR>', { desc = '[w]rite file forcefully' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'open diagnostic [q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "use h to move!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "use l to move!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "use k to move!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "use j to move!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'move focus to the upper window' })

-- NOTE: Some terminals have coliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'move line up and keep cursor position' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'scroll down and center cursor' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'scroll up and center cursor' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'search next and center cursor' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'search previous and center cursor' })

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = '[p]review [v]im file explorer' })

-- Use blackhole register for <leader> copy/paste
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'paste over selection without losing clipboard content' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'copy to system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'copy entire line to system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'delete without affecting clipboard' })

vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz', { desc = 'jump to next quickfix item' })
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz', { desc = 'jump to previous quickfix item' })

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'search and replace the word under the cursor globally' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
