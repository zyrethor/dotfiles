#!/bin/bash

if pgrep obs >/dev/null ; then
    if pgrep obs-ffmpeg-mux >/dev/null ; then
        echo "  "
    else
      echo ""
    fi
fi

