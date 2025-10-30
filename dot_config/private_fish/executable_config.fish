if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting ""

    alias ls='exa --icons'
    alias la='exa --icons -a'
    alias ll='exa -agl -F -s=mod -r --icons --git --group-directories-first --git'
    alias btop='btop -t'
    alias hx='helix'

    # alias cl="clear"
    alias lg="lazygit"
    alias ld="lazydocker"

    alias ss1="xrandr --output eDP-1 --auto --output HDMI-1 --auto"
    alias ss2="xrandr --output eDP-1 --off --output HDMI-1 --auto"
    alias copyfile="cat (string join ' ' \$argv) | xclip -selection clipboard"
    alias google-chrome="google-chrome-stable"
    
    alias ncm='ncmpcpp'
    alias neofetch='fastfetch'
    alias ytd='yt-dlp'
    alias ytda='yt-dlp -o "~/Videos/downloading/%(title).150B.%(ext)s" --extract-audio'
    alias ytd3='yt-dlp -o "~/Videos/downloading/%(title).150B.%(ext)s" --extract-audio --audio-format mp3'
    alias x12='xrandr --output HDMI-1 --mode 1920x1080 --scale 1.2x1.2'
    alias x1='xrandr --output HDMI-1 --mode 1920x1080 --scale 1x1'
    
    zoxide init fish | source
    starship init fish | source

    function delspace
      python ~/Documents/scripts/remove_trailing_spaces_inplace.py $argv
    end

    function run
      if test (count $argv) -ne 1
        echo "Usage: run <file.cpp>"
        return 1
      end
      set file $argv[1]
      g++ "$file.cpp" -o a.out
      and ./a.out < "in$file" > "out"
    end


    function zz
      set dir (zoxide query --list | fzf --reverse --preview 'exa -l {}')
      if test -n "$dir"
        cd "$dir"
      end
    end

    function cl
      if test "$TERM" = "rxvt-unicode"
        command reset
      else
        command clear
      end
    end

    function compresspdf
      gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=(basename $argv .pdf)_compressed.pdf $argv
    end

    function mkvenv
        set name (or $argv "myenv")
        python -m venv $name
        source $name/bin/activate.fish
    end


    fish_vi_key_bindings
    bind -M insert -m default jk backward-char force-repaint
    bind -M insert -m insert \cf accept-autosuggestion force-repaint

    function fish_mode_prompt
      # NOOP - Disable vim mode indicator
    end
    set fish_cursor_default     block      
    set fish_cursor_insert      line       
    set fish_cursor_replace_one underscore 
    set fish_cursor_visual      block

    set fish_cursor_unknown 

    set -x ANDROID_HOME $HOME/Android/Sdk
    set -x PATH $HOME/.local/bin $ANDROID_HOME/emulator $ANDROID_HOME/platform-tools $PATH
    set -x JAVA_HOME /usr/lib/jvm/java-21-openjdk
    # set -x PATH /opt/google-cloud-cli/bin $PATH


    set -Ux EDITOR helix
    set -Ux VISUAL helix
end


# thefuck --alias | source
# rvm default

# pnpm
set -gx PNPM_HOME "/home/ian/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
