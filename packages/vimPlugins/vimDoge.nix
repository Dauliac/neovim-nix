{ pkgs
, src
,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "vim-doge";
  inherit src;
}
