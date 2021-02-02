{ pkgs, ... }:

let
  tokyonight-vim = pkgs.vimUtils.buildVimPlugin {
    name = "tokyonight-vim";
    src = pkgs.fetchFromGitHub {
      owner = "ghifarit53";
      repo = "tokyonight-vim";
      rev = "ea68b37bff60104e71ed50fc37fa8f8ac53b727d";
      sha256 = "0wvbsc20w64rhrvwgn8hirdbmips01iih1yw49k2as4hh6zqcamp";
    };
  };
  dashboard-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "dashboard-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "glepnir";
      repo = "dashboard-nvim";
      rev = "33b2dc11fe8e17cd87ffd8f9c9853f1e8720d116";
      sha256 = "1x4krrpr1ihy8j0ks7wnpbahs3w76d7c3l6kr8gi1i8cwyqp63i5";
    };
  };

in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      fzf-vim
      vim-nix
      vim-airline-themes
      vim-airline
      coc-nvim
      coc-fzf
      coc-git
      coc-spell-checker
      coc-vimtex
      neuron-vim
      vim-polyglot
      tokyonight-vim
      dashboard-nvim
    ];
    extraConfig = ''
      set nu rnu
      set backupdir=~/.local/share/nvim/backups
      syntax enable
      set termguicolors
      let g:tokyonight_style = 'night'
      let g:tokyonight_enable_italic = 1
      colorscheme tokyonight
    '';
  };
}
