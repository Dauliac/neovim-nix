{
  description = "TonyChG neovim flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };

    neovim = {
      url = "github:neovim/neovim/v0.9.1?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    telescope-recent-files-src = {
      url = "github:smartpde/telescope-recent-files";
      flake = false;
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = inputs@{ self, ... }:
    inputs.flake-utils.lib.eachDefaultSystem (system:
      let
        overlayFlakeInputs = prev: final: {
          neovim = inputs.neovim.packages.${prev.system}.neovim;

          vimPlugins = final.vimPlugins // {
            telescope-recent-files = import ./packages/vimPlugins/telescopeRecentFiles.nix {
              src = inputs.telescope-recent-files-src;
              pkgs = prev;
            };
          };
        };

        overlayNeovimPrimaMateria = prev: final: {
          neovimPrimaMateria = import ./packages/neovimPrimaMateria.nix {
            pkgs = prev;
          };
        };

        pkgs = import inputs.nixpkgs {
          system = system;
          overlays = [ overlayFlakeInputs overlayNeovimPrimaMateria ];
        };
      in
      {
        packages = rec {
          nvim = pkgs.neovimPrimaMateria;
          default = nvim;
        };

        apps = rec {
          nvim = inputs.flake-utils.lib.mkApp { drv = self.packages.${system}.nvim; };
          default = nvim;
        };
      });
}
