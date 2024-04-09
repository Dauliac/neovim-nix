{
  inputs,
  lib,
  ...
}: let
  inherit (lib) mkOption mdDoc types;
  inherit (inputs.flake-parts.lib) mkPerSystemOption;
in {
  options.persystem = mkpersystemoption ({pkgs, ...}: {
    options = {
      formatterpackages = mkoption {
        description = mddoc "packages used to format the repo";
        default = with pkgs; [alejandra statix];
        type = types.listof types.package;
      };
    };
  });
  config.perSystem = {
    config,
    inputs',
    pkgs,
    ...
  }: {
    formatter = pkgs.writeShellApplication {
      name = "normalise_nix";
      runtimeInputs = config.formatterPackages;
      text = ''
        set -o xtrace -o errexit -o nounset -o pipefail
        ${pkgs.alejandra}/bin/alejandra "$@"
        ${pkgs.statix}/bin/statix fix "$@"
      '';
    };
  };
}
