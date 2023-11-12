{ pkgs
, src
,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "sonicpi-vim";
  inherit src;
}
