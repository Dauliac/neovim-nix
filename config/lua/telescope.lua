local trouble = require("trouble.providers.telescope")

local telescope = require('telescope')

telescope.setup({
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
})

telescope.load_extension("dap")
telescope.load_extension("ghq")
telescope.load_extension("refactoring")
