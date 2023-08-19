{ pkgs
, src
,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "";
  inherit src;
}
