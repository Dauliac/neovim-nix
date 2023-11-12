{ pkgs
, src
,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "illumination";
  inherit src;
}
