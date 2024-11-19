{ config, pkgs, ... }:

{
  imports = [
    ./programs/fish.nix
    ./programs/kitty.nix
    ./window-managers/hyprland.nix
  ];

  home = {
    username = "keiran";
    homeDirectory = "/home/keiran";
    stateVersion = "24.05";

    packages = with pkgs; [
      fastfetch
      hyprpaper
      hyprshot
      hyprland
      firefox
      neovim
      wofi
      fzf
      fd
    ];
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;
}
