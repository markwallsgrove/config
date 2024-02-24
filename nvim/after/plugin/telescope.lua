local builtin = require('telescope.builtin')

-- find project file
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

-- find files that are controlled with git
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- grep through the project files
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
