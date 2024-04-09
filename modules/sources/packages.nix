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
      packages = {
        plugins = mkOption {
          description = mdDoc "Packages required by plugins";
          # TODO: split it into separate options per plugins
          default = with pkgs; [
            fd
            ghq
            ripgrep
            xsel
            stylua
            ltex-ls
            lazygit
            terraform-ls
            gopls
            vscode-langservers-extracted
            yaml-language-server
            lua-language-server
            # NOTE: nix
            alejandra
            nixpkgs-fmt
            nixfmt
            nil
            # NOTE: rust
            rust-analyzer
            rustfmt
            vscode-extensions.llvm-org.lldb-vscode
            # NOTE: typos
            typos
            # NOTE: docker
            hadolint
            # NOTE: shell
            shfmt
            shellcheck
            shellharden
            dotenv-linter
            pyright
            nodePackages.dockerfile-language-server-nodejs
            nodePackages.bash-language-server
            nodePackages.prettier
            nodePackages.typescript
            nodePackages."@volar/vue-language-server"
            # NOTE: nulls
            php83Packages.phpstan
            php83Packages.phan
            php83Packages.php-codesniffer
            phpactor
            python311Packages.pynvim
          ];
          type = types.listof types.package;
        };
      };
    };
  });
}
