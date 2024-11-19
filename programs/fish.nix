{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    
    interactiveShellInit = ''
      set fish_greeting
      
      set -U fish_color_param brblue
      set -U fish_color_command brgreen
      set -U fish_color_error brred
      set -U fish_color_quote bryellow
      set -U fish_color_operator brmagenta
      set -U fish_color_end brmagenta
      set -U fish_color_autosuggestion brblack
    '';

    functions = {
      fish_right_prompt = "";

      fish_prompt = ''
        set -l last_status $status
        
        set_color brblue
        echo -n (prompt_pwd)
        
        set -l git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')
        if test -n "$git_branch"
          set_color brmagenta
          echo -n " $git_branch"
          
          if test -n "(git status --porcelain 2>/dev/null)"
            set_color brred
            echo -n "*"
          end
        end
        
        if test $last_status -ne 0
          set_color brred
        else
          set_color brgreen
        end
        echo -n " λ "
        set_color normal
      '';

      mkcd = ''
        mkdir -p $argv; and cd $argv
      '';
    };

    shellAliases = {
      ll = "ls -lah";
      gs = "git status";
      gd = "git diff";
      ff = "fastfetch";
    };

    plugins = [
      {
        name = "fzf";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      {
        name = "z";
        src = pkgs.fishPlugins.z.src;
      }
    ];
  };
}
