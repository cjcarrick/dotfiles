#!/usr/bin/env bash

help() {
    echo "Usage: screenshot.sh <save path>"
    echo "Use __%CLIPBAORD%__ as the save path to save the image to the clipboard."
}

if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    help
    exit 1
fi

tmp=$(date +%s)
maim -us "/tmp/$tmp.png"

savePath="$HOME/Pictures/"

if [[ $1 == "__%CLIPBAORD%__" ]]; then

    xclip -selection clipboard -t image/png -i "/tmp/$tmp.png"

    res=$(timeout 10 bash -c "notify-send.py \"$tmp.png\" \"Screenshot copied to clipboard.\" \
        --action save:Save\ to\ ${savePath}\
        --hint string:image-path:file://tmp/$tmp.png")

    if [[ "$res" =~ "save" ]]; then
        cp "/tmp/$tmp.png" "$savePath"
    else
        rm "/tmp/$tmp.png"
    fi
else

    cp "/tmp/$tmp.png" "$savePath"

    res=$(timeout 10 bash -c "notify-send.py \"$tmp.png\" \"Screenshot saved to $savePath.\" \
        --action copy:Copy\ to\ clipboard\
        --hint string:image-path:file://tmp/$tmp.png")

    if [[ "$res" =~ "copy" ]]; then
        xclip -selection clipboard -t image/png -i "/tmp/$tmp.png"
    else
        rm "/tmp/$tmp.png"
    fi

fi
