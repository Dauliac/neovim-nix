require("copilot").setup({
  panel = {
    enabled = true,
    auto_refresh = true,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<cr>",
      refresh = "gr",
      open = "<m-cr>",
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4,
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = false,
    debounce = 75,
    keymap = {
      accept = "<m-l>",
      accept_word = false,
      accept_line = false,
      next = "<m-]>",
      prev = "<m-[>",
      dismiss = "<c-]>",
    },
  },
  filetypes = {
    ["*"] = true,
  },
  copilot_node_command = "node", -- node.js version must be > 16.x
  server_opts_overrides = {},
})
