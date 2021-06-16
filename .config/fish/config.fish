############
### Path ###
############

set -x PATH $PATH /sbin/

###############
### Aliases ###
###############

### ls ### 

function ls
    command ls --color=always $argv # ls with color
end

function la
    command ls --color=always -a $argv # ls list all files
end

function ll
    command ls --color=always -la $argv # ls long format
end

### Misc ###

function pipes
    pipes.sh # Pipes screensaver
end

function fish_prompt
    set_color blue
    printf '┌──'
    set_color green
    printf '('(id -un)'@'(/usr/lib/gettext/hostname)')'
    set_color blue
    printf '─('(prompt_pwd)')'
    printf '\n└'
    if test $status = 0
        set_color green
    end
    if test $status != 0
        set_color red
    end
    printf '❯ '
end
