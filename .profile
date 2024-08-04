export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_AUTO_SCREEN_SCALE_FACTOR=1
#export QT_SCALE_FACTOR=1.2
export QT_ENABLE_HIGHDPI_SCALING=1
export MOZ_USE_XINPUT2=1
export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1
export PAGER=less
export MANWIDTH=80
export MANPAGER="less -FiRswX"
export LESS='-F -g -i -M -R -S -w -X -z-4'
export VISUAL="emacsclient -c -a emacs"
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t -a ''"
#export VISUAL="emacsclient -c -a emacs"
export DUNST_SIZE='250x20-30+30'
export MAKEFLAGS="-j9 -l8"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export TERM="xterm-256color"
export HISTCONTROL=ignoredups:erasedups



# disable core dumps
ulimit -S -c 0
