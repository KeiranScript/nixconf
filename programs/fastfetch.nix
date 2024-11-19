{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch
  ];

  xdg.configFile."fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "display": {
        "separator": "  "
      },
      "modules": [
        {
          "type": "title",
          "format": "{?1}keiran@nixos{?}"
        },
        {
          "type": "os",
          "format": "{2}"
        },
        {
          "type": "kernel",
          "format": "v{2}"
        },
        {
          "type": "shell",
          "format": "{1}"
        },
        {
          "type": "wm",
          "format": "{?2} {2}"
        },
        {
          "type": "memory",
          "format": "{?2} {2}"
        },
        {
          "type": "cpu",
          "format": "{1}",
          "temperature": true
        },
        {
          "type": "disk",
          "format": "{?2} {2}"
        },
      ],
      "logo": {
        "type": "small",
        "padding": {
          "left": 2
        }
      }
    }
  '';

  programs.fish.shellAliases = {
    ff = "fastfetch";
  };
}
