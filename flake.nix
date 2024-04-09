{
  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-stable";
    flake-parts.url = "github:hercules-ci/flake-parts";
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
  };
  outputs = inputs @ {
    nixpkgs,
    flake-parts,
    neovim,
    telescope-recent-files-src,
    telescope-ghq-src,
    lsplens-src,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} (_: {
      systems = ["x86_64-linux"];
      imports = [./modules];
    });
}
