{...}: {
  imports = [
    ./packages.nix
    ./plugins.nix
  ];
  options.persystem = mkPerSystemOption ({pkgs, ...}: {
    options = {
      nvim = mkOption {
        description = mdDoc "Neovim package";
        default = with pkgs.vimPlugins; [
          which-key-nvim
          nvim-web-devicons
          catppuccin-nvim
        ];
        type = types.listof types.package;
      };
    };
  });
}
