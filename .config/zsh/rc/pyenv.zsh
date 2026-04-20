#----------------------------------------------------------#
##  Pyenv                                                 ##
#----------------------------------------------------------#

export PYENV_ROOT="$HOME/.pyenv"
# shims path is already set in .zshenv
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

# Define pyenv shell function manually to avoid slow eval "$(pyenv init -)"
pyenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(pyenv "sh-$command" "$@")"
    ;;
  *)
    command pyenv "$command" "$@"
    ;;
  esac
}
