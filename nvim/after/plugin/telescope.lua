local telescope = require('telescope.builtin')

-- find project file
vim.keymap.set('n', '<leader>pf', telescope.find_files, {})

vim.keymap.set('n', '<leader>vb', telescope.buffers, {})

-- find files that are controlled with git
vim.keymap.set('n', '<C-p>', telescope.git_files, {})

-- grep through the project files
vim.keymap.set('n', '<leader>ps', function()
	telescope.grep_string({ search = vim.fn.input("Grep > ") })
end)
