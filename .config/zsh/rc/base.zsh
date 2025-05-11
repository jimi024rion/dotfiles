#----------------------------------------------------------#
##  Base Configuration                                    ##
#----------------------------------------------------------#

HOSTNAME="$HOST"
HISTFILE="${ZDATADIR}/zsh_history"
HISTSIZE=10000                              # Number of histories in memory
SAVEHIST=100000                             # Number of histories to be saved
HISTORY_IGNORE="(ls|cd|pwd|zsh|exit|cd ..)" # Ignore these commands in history
LISTMAX=1000                                # number of completion listings to ask for (1=shut up, 0=ask when window overflows)
