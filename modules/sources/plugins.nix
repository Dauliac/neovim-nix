{
  inputs,
  lib,
  ...
}: let
  inherit (lib) mkOption mdDoc types;
  inherit (inputs.flake-parts.lib) mkPerSystemOption;
in {
  options.persystem = mkPerSystemOption ({pkgs, ...}: {
    options = {
      plugins.style = {
        plugins = mkOption {
          description = mdDoc "Neovim plugins to manage style";
          default = with pkgs.vimPlugins; [
            which-key-nvim
            nvim-web-devicons
            catppuccin-nvim
          ];
          type = types.listof types.package;
        };
      };
      plugins.ui = mkOption {
        description = mdDoc "NeoVim plugins to manage UI";
        default = with pkgs.vimPlugins; [
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
        ];
        type = types.listof types.package;
      };
      plugins.codeEdit = mkOption {
        description = mdDoc "NeoVim plugins to manage code edit";
        default = with pkgs.vimPlugins; [
          ssr-nvim
          comment-nvim
          nvim-autopairs
          indent-blankline-nvim-lua
          firenvim
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
        ];
        type = types.listof types.package;
      };
      plugins.git = mkOption {
        description = mdDoc "NeoVim plugins to manage git helpers";
        default = with pkgs.vimPlugins; [
          lazygit-nvim
          gitsigns-nvim
          vim-gitgutter
          diffview-nvim
        ];
        type = types.listof types.package;
      };
      plugins.debug = mkOption {
        description = mdDoc "NeoVim plugins to manage debug tools";
        default = with pkgs.vimPlugins; [
          nvim-dap
          nvim-dap-ui
          telescope-dap-nvim
          nvim-dap-virtual-text
          nvim-spectre
          refactoring-nvim
          neodev-nvim
        ];
        type = types.listof types.package;
      };
      plugins.completion = mkOption {
        description = mdDoc "NeoVim plugins to manage code completion";
        default = with pkgs.vimPlugins; [
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
          rust-tools-nvim
        ];
        type = types.listof types.package;
      };
    };
  });
}
