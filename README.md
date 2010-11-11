EDITOR=`which vim`

if [ -x $EDITOR ]
    VIMRUNTIME=`vim -e -T dumb --cmd 'exe "set t_cm=\<C-M>"|echo $VIMRUNTIME|quit' | tr -d '\015' `
    if [ -x $VIMRUNTIME/macros/less.sh ]; then
        PAGER=$VIMRUNTIME/macros/less.sh
        MANPAGER="col -b | $VIMRUNTIME/macros/less.sh -c 'set ft=man' -"
    else
        PAGER=less
    fi
else
    EDITOR=vi
fi

export EDITOR PAGER MANPAGER
