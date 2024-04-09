require("lsp-format").setup({
  typescript = {
    tab_width = function()
      return vim.opt.shiftwidth:get()
    end,
  },
  javascript = { tab_width = 2 },
  vue = { tab_width = 2 },
})

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = require("lsp-format").on_attach,
    capabilities = capabilities,
  },
})
