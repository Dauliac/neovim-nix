{ pkgs
, src
,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "phpactor";
  inherit src;
}
