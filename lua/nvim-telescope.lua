local opt = { noremap = true }
local telescope = require("telescope")

telescope.setup({
	defaults = {
		layout_strategy = "vertical",
		path_display = {
			"truncate",
		},
		file_ignore_patterns = { "^.git/" },
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
	extensions = {
		recent_files = {
			only_cwd = true,
		},
	},
})

telescope.load_extension("recent_files")

vim.api.nvim_set_keymap("n", "<leader><tab>", ":lua require('telescope.builtin').find_files()<CR>", opt)
-- vim.api.nvim_set_keymap("n", "<leader><tab>", ":lua require('telescope.builtin').buffers()<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader>`", ":lua require('telescope.builtin').live_grep()<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader>~", ":lua require('telescope.builtin').grep_string()<CR>", opt)
vim.api.nvim_set_keymap(
	"n",
	"<leader><leader>",
	"<Cmd>lua require('telescope').extensions.recent_files.pick()<CR>",
	{ noremap = true, silent = true }
)

-- LSP
-- vim.api.nvim_set_keymap("n", ",aa", ":lua vim.lsp.buf.code_action()<cr>", opt)
-- vim.api.nvim_set_keymap("n", ",d", ":lua require('telescope.builtin').lsp_document_diagnostics()<cr>", opt)
-- vim.api.nvim_set_keymap("n", "gr", ":lua require('telescope.builtin').lsp_references()<cr>", opt)
vim.api.nvim_set_keymap("n", "gd", ":lua require('telescope.builtin').lsp_definitions()<cr>", opt)
