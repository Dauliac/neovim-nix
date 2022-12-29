{
  description = "PrimaMateria neovim flake";

  inputs = {
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    neovim = {
      url = "github:neovim/neovim?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    telescope-recent-files-src = {
      url = "github:smartpde/telescope-recent-files";
      flake = false;
    };

    noneckpain-src = {
      url = "github:shortcuts/no-neck-pain.nvim";
      flake = false;
    };
  };

  outputs = inputs@{ self, nixpkgs-unstable, neovim, telescope-recent-files-src
    , noneckpain-src, ... }:
    let
      overlay = prev: final: {
        neovimPrimaMateria = import ./packages/neovimPrimaMateria.nix {
          pkgs = prev;
          inherit telescope-recent-files-src noneckpain-src neovim;
        };
      };

      lib = import ./packages/lib.nix {
        pkgs = nixpkgs-unstable;
        inherit overlay;
      };

    in {
      packages = lib.defaultForEachFlakeSystem (pkgs: pkgs.neovimPrimaMateria);

      apps = lib.defaultForEachFlakeSystem (pkgs: {
        type = "app";
        program = "${pkgs.neovimPrimaMateria}/bin/nvim";
      });

      formatter.x86_64-linux =
        nixpkgs-unstable.legacyPackages.x86_64-linux.nixfmt;
    };
}
