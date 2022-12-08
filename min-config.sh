#!/usr/bin/env bash

set -euo pipefail
CFLAGS="-static -O3"
LDFLAGS="-static -O3"
CC=../clang-wrapper.sh
LD=../clang-wrapper.sh

configureFlags=(
        --cc=$CC
        --ld=$CC
        --extra-cflags="$CFLAGS"
        --extra-ldflags="$LDFLAGS"
        --disable-all
        --disable-everything # affects encoders/decoders/muxers/demuxers/filters/protocols/devices
        --disable-autodetect

        --enable-gpl
        --enable-version3

        --disable-inline-asm --disable-x86asm
        --disable-vulkan
        --disable-network
        --disable-doc

        --enable-static
        --enable-shared
        --enable-pic

        --enable-avcodec
        --enable-avfilter
        --enable-avformat
        --enable-swscale

        --enable-protocol=file
        --enable-decoder=h264
        --enable-demuxer=mov
        --enable-parser=h264
        --enable-encoder=gif
        --enable-muxer=gif
    )

exec ./configure "${configureFlags[@]}"
