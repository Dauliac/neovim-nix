{...}: {
  config.perSystem = {
    config,
    inputs',
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      inputsFrom = builtins.attrValues config.checks;
      nativeBuildInputs = with pkgs;
        [lefthook go-task] ++ formatterPackages;
      devShellHook = ''
        task install
      '';
    };
  };
}
