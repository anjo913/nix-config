{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./fonts.nix
    ./anjo.nix
    ./hardware
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelParams = [
      "usbcore.autosuspend=-1"
      "quiet vga=current"
    ];
  };

  networking = {
    hostName = "io";
    nameservers = [ "9.9.9.9" "149.112.112.112" ];
    useDHCP = false;
    interfaces = {
      enp3s0.useDHCP = true;
      wlp2s0.useDHCP = true;
    };
    enableIPv6 = false;
  };

  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  security.doas.enable = true;
  security.sudo.enable = false;

  services.xserver.enable = true;
  services.xserver.windowManager.bspwm.enable = true;
  services.xserver.libinput = {
    enable = true;
    mouse = {
      accelProfile = "flat";
      accelSpeed = "-0.5";
    };
  };
  programs.zsh.enable = true;
  users.users.anjo = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };
  time.timeZone = "US/Central";
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [

    # terminal
    zsh
    gcc
    htop
    neovim
    python
    python3
    wget
    curl
    pciutils
    unzip
    git
    exa

    killall
    feh
    powertop
    ntfs3g
    firefox-bin
    bspwm
    sxhkd
    pavucontrol
    font-manager
    glxinfo
    brightnessctl
    udisks
    firejail
    nodejs
    pkg-config
  ];

  programs.firejail = {
    enable = true;
  };

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.openssh.enable = true;

  system.stateVersion = "20.09";

}
