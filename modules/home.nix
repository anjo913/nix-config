{ config, pkgs, ... }:

{
  imports = [
  ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "anjo";
  home.homeDirectory = "/home/anjo";
  nixpkgs.config.allowUnfree = true;
  
  xsession.enable = true;
  lib.programs.steam.enable = true;

  home.packages = with pkgs; [

    discord
    appimage-run
    xclip
    fuse
    fuse3
    kitty
    rofi
    steam
    steam-run
    polybar
    crate2nix
    picom
    oh-my-zsh
    discocss
    zathura
    icu
    maim
    plover.stable
    keepassxc
    minecraft
    alacritty
    xorg.libxcb
    (let neuronSrc = builtins.fetchTarball "https://github.com/srid/neuron/archive/v1.tar.gz";
  in import neuronSrc {})
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}
