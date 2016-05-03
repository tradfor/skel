# .kshrc

# Source global definitions
if [ -f /etc/kshrc ]; then
        . /etc/kshrc
fi

# use emacs editing mode by default
# set -o emacs
set -o vi
case $- in
  *i*)
    # Interactive session. Try switching to bash.
    if [ -z "$BASH" ]; then # do nothing if running under bash already
      bash=$(command -v bash)
      if [ -x "$bash" ]; then
        export SHELL="$bash"
        exec "$bash" -l
      fi
    fi
esac
# User specific aliases and functions
