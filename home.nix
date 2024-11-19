{ config, pkgs, ... }:

{
  imports = [
    ./programs/fish.nix
    ./programs/kitty.nix
    ./programs/fastfetch.nix
    ./programs/wofi.nix
    ./hyprland/hyprpaper.nix
    ./hyprland/hyprland.nix
  ];

  home = {
    username = "keiran";
    homeDirectory = "/home/keiran";
    stateVersion = "24.05";

    packages = with pkgs; [
      clipboard-jh
      fastfetch
      hyprpaper
      hyprshot
      hyprland
      firefox
      python3
      neovim
      wofi
      bash
      mako
      eww
      lsd
      gcc
      fzf
      fd
      jq
    ];
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;

  programs.eww = {
    enable = true;
    package = pkgs.eww;
    configDir = ./eww;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      exec-once = eww daemon && eww open bar && hyprpaper
    '';
  };
}
