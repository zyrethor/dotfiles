if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting ""

    alias ls='exa --icons'
    alias la='exa --icons -a'
    alias ll='exa -agl -F -s=mod -r --icons --git --group-directories-first --git'
    alias btop='btop -t'

    # alias cl="clear"
    alias lg="lazygit"

    alias ss1="xrandr --output eDP-1 --auto --output HDMI-1 --auto"
    alias ss2="xrandr --output eDP-1 --off --output HDMI-1 --auto"
    alias copyfile="cat (string join ' ' \$argv) | xclip -selection clipboard"
    alias google-chrome="google-chrome-stable"
    
    alias ncm='ncmpcpp'
    
    zoxide init fish | source
    starship init fish | source

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

    set -x PATH $HOME/.local/bin $PATH
    # set -x PATH /opt/google-cloud-cli/bin $PATH
    
end


# thefuck --alias | source
# rvm default
