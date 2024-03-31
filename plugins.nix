{ pkgs }:
with pkgs.vimPlugins; [
  #  Style
  which-key-nvim
  nvim-web-devicons
  gruvbox-nvim
  # UI
  fzf-lua
  glow-nvim
  telescope-ghq
  lualine-lsp-progress
  lualine-nvim
  nvim-neoclip-lua
  nvim-tree-lua
  telescope-nvim
  plenary-nvim
  sqlite-lua
  registers-nvim
  lsp-colors-nvim
  todo-comments-nvim
  barbar-nvim
  neoscroll-nvim

  nui-nvim
  noice-nvim
  nvim-notify
  # Edit
  ssr-nvim
  comment-nvim
  nvim-autopairs
  indent-blankline-nvim-lua
  firenvim
  # vim-doge
  (nvim-treesitter.withPlugins (p: [
    p.javascript
    p.typescript
    p.lua
    p.html
    p.bash
    p.css
    p.jsdoc
    p.nix
    p.scss
    p.tsx
    p.rust
    p.yaml
    p.json
    p.dockerfile
    p.gomod
    p.puppet
    p.scss
    p.sql
    p.terraform
    p.jsonnet
    p.markdown
    p.python
    p.vim
    p.vimdoc
    p.php
    p.vue
  ]))
  lspsaga-nvim
  vim-vsnip
  nvim-lspconfig
  lsplens
  nvim-treesitter-context
  null-ls-nvim
  nvim-surround
  undotree
  zen-mode-nvim
  # git
  lazygit-nvim
  gitsigns-nvim
  vim-gitgutter
  diffview-nvim

  # debug
  nvim-dap
  nvim-dap-ui
  telescope-dap-nvim
  nvim-dap-virtual-text
  nvim-spectre
  refactoring-nvim
  neodev-nvim

  # completion
  copilot-lua
  copilot-cmp
  trouble-nvim
  lsplens
  lspkind-nvim
  lsp-format-nvim
  lsp-status-nvim
  vim-vsnip
  nvim-cmp
  cmp-nvim-lsp
  cmp-buffer
  cmp-path
  cmp-vsnip
  cmp-cmdline
  cmp-emoji
  ChatGPT-nvim
  indent-blankline-nvim-lua
  # rust
  rust-tools-nvim
]
