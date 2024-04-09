local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").pyright.setup({
  capabilities = capabilities,
  on_attach = require("lsp-format").on_attach,
})

require("lspconfig").phpactor.setup({
  capabilities = capabilities,
  on_attach = require("lsp-format").on_attach,
  init_options = {
    -- TODO: setup phpactor_bin
    -- language_server.phpactor_bin¶
    ["language_server_configuration.auto_config"] = false,
    ["language_server_phpstan.enabled"] = true,
    ["language_server_phpstan.level"] = 10,
    ["language_server_psalm.enabled"] = true,
    ["symfony.enabled"] = true,
    ["phpunit.enabled"] = true,
    ["prophecy.enabled"] = true,
    ["php_code_sniffer.enabled"] = true,
    ["xdebug_disable"] = false,
  },
})

require("lspconfig").terraformls.setup({
  capabilities = capabilities,
  on_attach = require("lsp-format").on_attach,
})

require("lspconfig").dockerls.setup({
  capabilities = capabilities,
  on_attach = require("lsp-format").on_attach,
  settings = {
    docker = {
      languageserver = {
        formatter = {
          ignoreMultilineInstructions = true,
        },
      },
    },
  },
})
require("lspconfig").gopls.setup({
  capabilities = capabilities,
  on_attach = require("lsp-format").on_attach,
})
require("lspconfig").rnix.setup({
  capabilities = capabilities,
  on_attach = require("lsp-format").on_attach,
})
require("lspconfig").eslint.setup({
  capabilities = capabilities,
  on_attach = require("lsp-format").on_attach,
})
require("lspconfig").lua_ls.setup({
  capabilities = capabilities,
  on_attach = require("lsp-format").on_attach,
})

require("lspconfig").yamlls.setup({
  capabilities = capabilities,
  on_attach = require("lsp-format").on_attach,
  settings = {
    yaml = {
      format = {
        bracketSpacing = false,
      },
      schemas = {
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] =
        "k8s/**/*.yml",
        ["https://taskfile.dev/schema.json"] = "**/Taskfile.yml",
        ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] =
        ".gitlab-ci.yml",
        ["https://json.schemastore.org/container-structure-test.json"] = ".cst.yml",
      },
    },
  },
})

local prettier = {
  formatCommand = [[prettier --stdin-filepath ''${INPUT} ''${--tab-width:tab_width}]],
  formatStdin = true,
}
require("lspconfig").volar.setup({
  filetypes = {
    "javascript",
    "json",
    "vue",
  },
  capabilities = capabilities,
  on_attach = require("lsp-format").on_attach,
  init_options = {
    typescript = {
      tsdk = "${pkgs.nodePackages.typescript}/lib/node_modules/typescript/lib",
    },
  },
  settings = {
    languages = {
      javascript = { prettier },
      typescript = { prettier },
      vue = { prettier },
    },
  },
})

require("lspconfig").nil_ls.setup({
  autostart = true,
})
