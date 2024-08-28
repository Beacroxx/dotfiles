set-env EDITOR nano

set-env MAKEFLAGS -j24

set-env LIBRARY_PATH /usr/lib64:/usr/lib:/usr/lib32:$E:LIBRARY_PATH
set-env LIBRARY_PATH /home/bea/aocc-compiler-4.2.0/lib:/home/bea/aocc-compiler-4.2.0/lib32:$E:LIBRARY_PATH
set-env LD_LIBRARY_PATH /usr/lib64:/usr/lib:/usr/lib32:$E:LD_LIBRARY_PATH
set-env LD_LIBRARY_PATH /home/bea/aocc-compiler-4.2.0/ompd:/home/bea/aocc-compiler-4.2.0/lib:/home/bea/aocc-compiler-4.2.0/lib32:$E:LD_LIBRARY_PATH
set-env PATH /home/bea/aocc-compiler-4.2.0/bin:$E:PATH
set-env PATH /home/bea/aocc-compiler-4.2.0/share/opt-viewer:$E:PATH

if (not (has-env C_INCLUDE_PATH)) {
    set-env C_INCLUDE_PATH /home/bea/aocc-compiler-4.2.0/include
} else {
    set-env C_INCLUDE_PATH $E:C_INCLUDE_PATH:/home/bea/aocc-compiler-4.2.0/include
}

if (not (has-env CPLUS_INCLUDE_PATH)) {
    set-env CPLUS_INCLUDE_PATH /home/bea/aocc-compiler-4.2.0/include
} else {
    set-env CPLUS_INCLUDE_PATH $E:CPLUS_INCLUDE_PATH:/home/bea/aocc-compiler-4.2.0/include
}

set-env FZF_DEFAULT_OPTS "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc  --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

fn ls {|@a| eza -lH --no-time --git --smart-group --mounts --no-quotes $@a }

fn mainsail {|@a| ssh pi@mainsail.local -q $@a }

fn yaysearch {
    yay -S (yay -Pc | fzf --reverse --multi --preview "( yay -Qi {1} 2>/dev/null || yay -Si {1} 2>/dev/null ) | fmt -sw $(expr $(tput cols) / 2 - 5 )" | sed 's/\t.*/ /g' | tr -d '\012\015' )
}

use epm
set-env CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
eval (carapace _carapace|slurp)
eval (zoxide init elvish | slurp)
eval (starship init elvish)
