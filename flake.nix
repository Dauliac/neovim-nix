{
  description = "Dauliac neovim flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    neovim = {
      url = "github:neovim/neovim/v0.9.1?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    telescope-recent-files-src = {
      url = "github:smartpde/telescope-recent-files";
      flake = false;
    };
    telescope-ghq-src = {
      url = "github:nvim-telescope/telescope-ghq.nvim";
      flake = false;
    };
    lsplens-src = {
      url = "github:VidocqH/lsp-lens.nvim";
      flake = false;
    };
    gitlab-nvim-src = {
      url = "github:harrisoncramer/gitlab.nvim";
      flake = false;
    };
    sonic-pi-vim-src = {
      url = "github:dermusikman/sonicpi.vim";
      flake = false;
    };
  };

  outputs = inputs @ { self, ... }:
    inputs.flake-utils.lib.eachDefaultSystem (system:
      let
        overlayFlakeInputs = prev: final: {
          inherit (inputs.neovim.packages.${prev.system}) neovim;

          vimPlugins =
            final.vimPlugins
            // {
              telescope-recent-files = import ./packages/vimPlugins/telescopeRecentFiles.nix {
                src = inputs.telescope-recent-files-src;
                pkgs = prev;
              };
              lsplens = import ./packages/vimPlugins/lsplens.nix {
                src = inputs.lsplens-src;
                pkgs = prev;
              };
              telescope-ghq = import ./packages/vimPlugins/telescopeGhq.nix {
                src = inputs.telescope-ghq-src;
                pkgs = prev;
              };
              gitlab-nvim = import ./packages/vimPlugins/gitlabNvim.nix {
                src = inputs.gitlab-nvim-src;
                pkgs = prev;
              };
              sonic-pi-vim = import ./packages/vimPlugins/sonicpi-vim.nix {
                src = inputs.sonic-pi-vim-src;
                pkgs = prev;
              };
              # vim-doge = import ./packages/vimPlugins/vimDoge.nix {
              #   src = inputs.vim-doge-src;
              #   pkgs = prev;
              # };
            };
        };
        overlayNeovimDauliac = prev: final: {
          neovimDauliac = import ./packages/neovimDauliac.nix {
            pkgs = prev;
          };
        };

        pkgs = import inputs.nixpkgs {
          inherit system;
          overlays = [ overlayFlakeInputs overlayNeovimDauliac ];
        };

        formatterPackages = with pkgs; [
          nixpkgs-fmt
          alejandra
          statix
        ];
        nvim = inputs.flake-utils.lib.mkApp { drv = self.packages.${system}.nvim; };
      in
      {
        packages = rec {
          nvim = pkgs.neovimDauliac;
          default = nvim;
        };

        apps.default = nvim;

        formatter = pkgs.writeShellApplication {
          name = "normalise_nix";
          runtimeInputs = formatterPackages;
          text = ''
            set -o xtrace
            alejandra "$@"
            nixpkgs-fmt "$@"
            statix fix "$@"
          '';
        };

        checks = {
          inherit nvim;
          typos = pkgs.mkShell {
            buildInputs = with pkgs; [ typos ];
            shellHook = ''
              typos .
            '';
          };
          yamllint = pkgs.mkShell {
            buildInputs = with pkgs; [ yamllint ];
            shellHook = ''
              yamllint .
            '';
          };
          luaCheck = pkgs.mkShell {
            buildInputs = with pkgs; [ luaPackages.luacheck ];
            shellHook = ''
              luacheck . --globals vim feedkey
            '';
          };
        };

        devShells.default =
          pkgs.mkShell
            {
              inputsFrom = builtins.attrValues self.checks.${system};

              nativeBuildInputs = with pkgs;
                [
                  lefthook
                  go-task
                ]
                ++ formatterPackages;

              devShellHook = ''
                task install
              '';
            };
      });
}
