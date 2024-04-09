require("lspconfig").phan.setup({
  capabilities = capabilities,
  on_attach = require("lsp-format").on_attach,
})
