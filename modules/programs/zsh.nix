{ ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    shellAliases = {
      home = "cd ~";
      c = "clear";
      k = "killall";
      v = "nvim";
      e = "nvim";
      untar = "tar -zxvf";
      wget = "wget -c";
      ping = "ping -c 5";
      n = "su -c nixos-rebuild";
      l = "exa --icons";
      ls = "exa --icons";
      la = "exa --icons -a";
      tree = "exa --icons --tree";
      treea = "exa --icons --tree -a";
      config = "cd /etc/nixos";
      df = "df -h";
      rebuild = "su root -c 'nixos-rebuild switch'";
      sudo = "doas";
      nixos-rebuild = "su root -c nixos-rebuild";
    };
    shellGlobalAliases = {
      g = "grep";
    };
    enableCompletion = true;
    enableAutosuggestions = true;
    initExtra = ''
      export EDITOR=nvim
      fpath+=$HOME/.config/zsh/pure
      autoload -U promptinit; promptinit
      prompt pure
    '';
    plugins = [
    ];
  };
}
