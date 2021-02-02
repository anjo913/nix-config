{ lib, pkgs, ... }:

with lib;
{
  fonts = {
    fontconfig = {
      enable = true;
    };
    fonts = with pkgs; [
      emojione
      iosevka
      # adobe source fonts
      source-sans-pro
      source-serif-pro
      source-code-pro
      source-han-mono
      source-han-sans
      source-han-serif
      source-han-code-jp

      noto-fonts
      inter
      cozette

      (nerdfonts.override { fonts = [ "SourceCodePro" ]; })
    ];
  };
}
