{ pkgs
, src
,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "dressing";
  inherit src;
}
