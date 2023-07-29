vim.cmd.syntax("on")

-- Options
vim.opt.clipboard:append({ 'unnamedplus' })
vim.opt.cc = "120"
vim.opt.listchars = {
    tab = "▸ ",
    trail = "·",
    extends = "»",
    precedes = "«",
    nbsp = "␣",
    eol = "↲",
}

vim.keymap.set("i", "<Tab>", "vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'", { expr = true })
vim.keymap.set("s", "<Tab>", "vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'", { expr = true })
vim.keymap.set("i", "<S-Tab>", "vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'", { expr = true })
vim.keymap.set("s", "<S-Tab>", "vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'", { expr = true })
