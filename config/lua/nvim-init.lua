require("nvim-autopairs").setup()
require("glow").setup()
require("registers").setup()
require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})

local rt = require("rust-tools")

rt.setup({
    server = {
        on_attach = require("lsp-format").on_attach,
    },
})

vim.cmd.syntax("on")
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()

-- Options
vim.opt.clipboard:append({ 'unnamedplus' })
vim.opt.cc = "80"
vim.opt.listchars = {
    tab = "▸ ",
    trail = "·",
    extends = "»",
    precedes = "«",
    nbsp = "␣",
    eol = "↲",
}

-- Plugins
vim.g.copilot_no_tab_map = true

-- Keymaps
vim.g.mapleader = ";"
vim.keymap.set("t", '<C-p>', '<C-\\><C-n>')
vim.keymap.set("n", '<C-f>', '<cmd>:Telescope find_files<CR>', { silent = true })
vim.keymap.set("n", '<C-b>', '<cmd>:Telescope buffers<CR>', { silent = true })
vim.keymap.set("n", '<C-g>', '<cmd>:Telescope live_grep<CR>', { silent = true })
vim.keymap.set("n", '<C-p>', '<cmd>:Telescope builtin<CR>', { silent = true })
vim.keymap.set("n", '<space>e', '<cmd>:NvimTreeToggle<CR>', { silent = true })
vim.keymap.set("i", '<C-J>', "copilot#Accept('<CR>')", {
    noremap = true, silent = true, expr = true, replace_keycodes = false,
})
vim.keymap.set("i", "<Tab>", "vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'", { expr = true })
vim.keymap.set("s", "<Tab>", "vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'", { expr = true })
vim.keymap.set("i", "<S-Tab>", "vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'", { expr = true })
vim.keymap.set("s", "<S-Tab>", "vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'", { expr = true })
