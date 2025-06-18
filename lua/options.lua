vim.o.number = true -- Show absolute line numbers
vim.o.relativenumber = true -- Show relative line numbers (for easier movement)
vim.o.showmode = false -- Don't show mode (e.g., -- INSERT --); assume statusline does this
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus' -- Use system clipboard
end)
vim.o.breakindent = true -- Indent wrapped lines to match line start
vim.o.undofile = true -- Save undo history to a file
vim.o.ignorecase = true -- Case-insensitive search...
vim.o.smartcase = true -- ...unless search contains uppercase
vim.o.signcolumn = 'yes' -- Always show the sign column (for diagnostics, git, etc.)
vim.o.updatetime = 250 -- Faster updates (e.g., for diagnostics, CursorHold)
vim.o.timeoutlen = 300 -- Shorter timeout for key sequence completion
vim.o.splitright = true -- Vertical splits open to the right
vim.o.splitbelow = true -- Horizontal splits open below
vim.o.list = true -- Show invisible characters (tabs, trailing spaces, etc.)
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- Set symbols for invisible characters
vim.o.inccommand = 'split' -- Preview substitute command in a split window
vim.o.cursorline = true -- Highlight the current line
vim.o.scrolloff = 10 -- Keep 10 lines visible above/below cursor when scrolling
vim.o.confirm = true -- Prompt to save changes when closing unsaved buffers
-- Smart indent
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'cpp', 'c', 'python', 'r', 'sh', 'bash', 'markdown', 'md' },
  callback = function()
    local ft = vim.bo.filetype
    if ft == 'python' then
      vim.bo.shiftwidth = 4
      vim.bo.tabstop = 4
      vim.bo.softtabstop = 4
    else
      vim.bo.shiftwidth = 2
      vim.bo.tabstop = 2
      vim.bo.softtabstop = 2
    end
    vim.bo.expandtab = true
    vim.bo.smartindent = ft ~= 'markdown'
  end,
})
-- vim: ts=2 sts=2 sw=2 et
