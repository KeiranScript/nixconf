{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
  ];

  home.file."Pictures/Wallpapers/.keep".text = "";

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${config.home.homeDirectory}/Pictures/Wallpapers/nix-snowflake.png

    wallpaper = ,${config.home.homeDirectory}/Pictures/Wallpapers/nix-snowflake.png
    
    # Optional: enable splash text rendering
    splash = false

    # Optional: set ipc control socket path
    ipc = off
  '';

  home.file."Pictures/Wallpapers/nix-snowflake.png".source = ./wallpapers/nix-snowflake.png;
}
