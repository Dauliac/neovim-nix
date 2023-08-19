{ pkgs
, src
,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "gitlab.nvim";
  inherit src;
}
