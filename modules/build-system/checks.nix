{...}: {
  config.perSystem = {
    config,
    inputs',
    pkgs,
    ...
  }: {
    checks = {
      inherit (config.packages) nvim;
      typos = pkgs.mkShell {
        buildInputs = with pkgs; [typos];
        shellHook = ''
          typos .
        '';
      };
      yamllint = pkgs.mkShell {
        buildInputs = with pkgs; [yamllint];
        shellHook = ''
          yamllint .
        '';
      };
      luaCheck = pkgs.mkShell {
        buildInputs = with pkgs; [luaPackages.luacheck];
        shellHook = ''
          luacheck . --globals vim feedkey
        '';
      };
    };
  };
}
