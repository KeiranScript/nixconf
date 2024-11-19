{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    
    interactiveShellInit = ''
      # Remove greeting
      set fish_greeting
      
      # Set colors for directories, files, etc
      set -U fish_color_param brblue
      set -U fish_color_command brgreen
      set -U fish_color_error brred
      set -U fish_color_quote bryellow
      set -U fish_color_operator brmagenta
      set -U fish_color_end brmagenta
      set -U fish_color_autosuggestion brblack
    '';

    functions = {
      # Clear any existing prompt functions
      fish_right_prompt = "";

      fish_prompt = ''
        set -l last_status $status
        
        # Current directory
        set_color brblue
        echo -n (prompt_pwd)
        
        # Git information
        set -l git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')
        if test -n "$git_branch"
          set_color brmagenta
          echo -n " $git_branch"
          
          # Check for git changes
          if test -n "(git status --porcelain 2>/dev/null)"
            set_color brred
            echo -n "*"
          end
        end
        
        # Prompt symbol
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
