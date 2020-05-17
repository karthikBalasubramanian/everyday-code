# ---------------------------------------------------------------------------
#
#  Description:  This file holds all my BASH configurations and aliases
#
#  Sections:
#  1.  Environment Configuration
#  2.  Make Terminal Better (remapping defaults and adding functionality)
#  3.  File and Folder Management
#  4.  Searching
#  5.  Process Management
#  6.  Networking
#  7.  System Operations & Information
#  8.  Web Development
#  9.  Reminders & Notes
#
#  ---------------------------------------------------------------------------


#   -------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   -------------------------------


#   Change Prompt
#   ------------------------------------------------------------

    export PS1="________________________________________________________________________________\n| \w @ \h (\u) \n| => "
    export PS2="| => "

#   Set Paths
#   ------------------------------------------------------------
    unset PATH
    export PATH="$PATH:/usr/local/bin/"
    export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

#   ------------------------------------------------------------
#   Custom to XYZ.Inc
#   ------------------------------------------------------------

#   ------------------------------------------------------------
#   Custom to XYZ.Inc
#   ------------------------------------------------------------

#   Set Sublime as default editor
#   ------------------------------------------------------------
#   Follow steps 1 & 2 in https://gist.github.com/barnes7td/3804534

    export PATH="$HOME/bin:$PATH"
    export EDITOR='subl -w'

#   Cleanup duplicates from $PATH
#   -------------------------------------------------------------

    export PATH=$(echo "$PATH" | awk -v RS=: -v ORS=: '!(a[$0]++)' | sed 's/:$//')

#   Set default blocksize for ls, df, du
#   ------------------------------------------------------------
    export BLOCKSIZE=1k

#   Add color to terminal
#   (this is all commented out as I use Mac Terminal Profiles)
#   from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#   ------------------------------------------------------------
    export CLICOLOR=1
    export LSCOLORS=ExFxBxDxCxegedabagacad

#   ==============================================================================

#   -----------------------------
#   2. MAKE TERMINAL BETTER
#   -----------------------------

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

alias edit='subl'                           # edit: Opens any file in sublime editor
alias f='open -a Finder ./'                 # f: Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~: Go Home
alias c='clear'                             # c: Clear terminal display

alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths

alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive

mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview

alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop

#Git
alias branch='git branch'
alias remote='git remote -v'
alias push='git push origin master'
alias merge='git checkout master; git fetch upstream; git merge upstream/master; ${push}'

#   ------------------------------------------------------------
#   Custom to XYZ.Inc
#   ------------------------------------------------------------

#   ------------------------------------------------------------
#   Custom to XYZ.Inc
#   ------------------------------------------------------------

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.            Example: mans mplayer codec
#   --------------------------------------------------------------------
    mans () {
        man $1 | grep -iC2 --color=always $2 | less
    }