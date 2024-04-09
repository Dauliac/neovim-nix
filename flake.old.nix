{
  description = "Dauliac neovim flake";

  outputs = inputs @ {self, ...}:
    inputs.flake-utils.lib.eachDefaultSystem (system: let
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
          };
      };
      overlayNeovimDauliac = prev: final: {
        neovimDauliac = import ./packages/neovimDauliac.nix {pkgs = prev;};
      };

      pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [overlayFlakeInputs overlayNeovimDauliac];
      };
      nvim =
        inputs.flake-utils.lib.mkApp {drv = self.packages.${system}.nvim;};
    in {
      packages = rec {
        nvim = pkgs.neovimDauliac;
        default = nvim;
      };

      apps.default = nvim;
    });
}
