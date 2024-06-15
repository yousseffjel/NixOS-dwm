# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    arc-kde-theme
    cava
    cmatrix
    dash
    feh
    font-awesome
    gnumake
    grim
    imlib2
    jetbrains-mono
    kate
    lolcat
    lxappearance
    mako
    materia-kde-theme
    ocs-url
    pavucontrol
    picom
    python311Packages.sparklines
    pywal
    rofi
    slstatus
    sddm-kcm
    sxhkd
    xfce.thunar
    xfce.thunar-archive-plugin
    xorg.libX11.dev
    xorg.libXft
    xorg.libXinerama
    yad
    peazip
];
}
