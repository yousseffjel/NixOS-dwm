# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# never put virtualbox,mlocate in this list

{
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    htop
    neovim
    brave
    telegram-desktop
    unzip
    unrar
    tmux
    vscode
    neofetch
    gparted
    trash-cli
    zsync
    nodejs
    cargo
    lazygit
    fzf
    apple-cursor
    papirus-icon-theme
    starship
    celluloid
    gcc
    github-desktop
    nordic
    libgtop
    zoxide
    eza
    arandr
    arc-theme
    avahi
    baobab
    bash-completion
    bat
    bibata-cursors
    blueberry
    htop
    curl
    dex
    discord
    dmenu
    duf
    edid-decode
    etcher
    evince
    feh
    flameshot
    font-manager
    fsearch
    gimp
    git
    hack-font
    hblock
    hw-probe
    inkscape
    kitty
    lm_sensors
    lollypop
    lshw
    meld
    most
    neofetch
    networkmanagerapplet
    nixos-generators
    nomacs
    qbittorrent
    rxvt-unicode
    spotify
    tree
    #variety
    volumeicon
    vscode
    wget
    widevine-cdm
    xorg.xkill
    betterlockscreen
    dunst
    xcolor
    brightnessctl
    pamixer
    playerctl
    sshfs
    xss-lock
    notion
  ];
}
