if status is-interactive
    # Commands to run in interactive sessions can go here
end
  
# Colors of command and prompt
set fish_color_normal brcyan
set fish_color_autosuggestion '000000'  
set fish_color_command green
set fish_color_error red
set fish_color_param brcyan

# Aliases
alias ls "ls -F"
alias ll "exa --long --header -F --icons"

# Functions
function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t $history[1]; commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end

