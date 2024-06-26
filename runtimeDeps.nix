{pkgs}:
with pkgs; [
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
  # formatter
  editorconfig-checker
  # nix
  alejandra
  nixpkgs-fmt
  nixfmt
  nil
  # rust
  rust-analyzer
  rustfmt
  vscode-extensions.llvm-org.lldb-vscode
  # typos
  typos
  # docker
  hadolint
  # shell
  shfmt
  shellcheck
  shellharden
  dotenv-linter
  # packages with results in /lib/node_modules/.bin must come at the end
  pyright
  nodePackages.dockerfile-language-server-nodejs
  nodePackages.bash-language-server
  nodePackages.prettier
  nodePackages.typescript
  nodePackages."@volar/vue-language-server"
  # nulls
  php83Packages.phpstan
  php83Packages.phan
  php83Packages.php-codesniffer
  phpactor
  python311Packages.pynvim
]
