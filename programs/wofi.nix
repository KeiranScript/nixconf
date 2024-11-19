{ config, lib, pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    settings = {
      width = "800px";
      height = "400px";
      location = "center";
      show = "drun";
      prompt = "Search...";
      filter_rate = 100;
      allow_markup = true;
      no_actions = true;
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 40;
      gtk_dark = true;
    };

    # Tokyo Night color scheme
    style = ''
      window {
        margin: 0px;
        background-color: #1a1b26;
        border-radius: 8px;
        border: 2px solid #7aa2f7;
      }

      #input {
        margin: 5px;
        padding: 5px;
        border-radius: 4px;
        border: none;
        color: #c0caf5;
        background-color: #24283b;
      }

      #inner-box {
        margin: 5px;
        background-color: #1a1b26;
      }

      #outer-box {
        margin: 5px;
        background-color: #1a1b26;
      }

      #scroll {
        margin: 0px;
        background-color: #1a1b26;
      }

      #text {
        margin: 5px;
        color: #c0caf5;
      }

      #entry:selected {
        background-color: #414868;
        border-radius: 4px;
      }

      #text:selected {
        color: #7aa2f7;
      }
    '';
  };
}
