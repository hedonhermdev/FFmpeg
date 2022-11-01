#!/usr/bin/env bash

set -euo pipefail
CFLAGS="-O3 -fPIC -static ${ARM_CFLAGS}"
LDFLAGS="${ARM_CFLAGS}"
CC=../user-trampoline-arm64/llvm_arm_nacl/build/bin/clang
# CC=clang
# CFLAGS="-O3 -fPIC -static"
# LDFLAGS="-O3 -fPIC -static"

configureFlags=(
        --cc=$CC
        --ld=$CC
        --extra-ldflags="$LDFLAGS"
        --extra-cflags="$CFLAGS"
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

        --enable-protocol=file
        --enable-decoder=h264
        --enable-demuxer=mov
        --enable-parser=h264
    )

exec ./configure "${configureFlags[@]}"
