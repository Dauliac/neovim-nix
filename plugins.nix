{ pkgs }:
with pkgs.vimPlugins; [
  #  Style 
  which-key-nvim
  nvim-web-devicons
  gruvbox-nvim
  # UI
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

  # Edit
  ssr-nvim
  comment-nvim
  nvim-autopairs
  indent-blankline-nvim-lua
  (nvim-treesitter.withPlugins (
    p: [
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
    ]
  ))


  vim-vsnip
  # AI
  nvim-lspconfig
  lspkind-nvim
  lsplens
  # 
  nvim-treesitter-context
  diffview-nvim
  # git
  lazygit-nvim
  gitsigns-nvim
  vim-gitgutter

  # debug
  nvim-dap
  nvim-dap-ui
  telescope-dap-nvim
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
  nvim-lspconfig
  vim-vsnip
  nvim-cmp
  cmp-nvim-lsp
  cmp-buffer
  cmp-path
  cmp-vsnip
  cmp-cmdline
  cmp-emoji

  # rust
  rust-tools-nvim
]
