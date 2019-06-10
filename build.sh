#!/bin/sh
# Auto-deteect an ARCH if not specified
if [ -z "$ARCH" ]
then
    for MAYBECC in cc gcc clang
    do
        $MAYBECC -dumpmachine > /dev/null 2> /dev/null &&
        ARCH=`$MAYBECC -dumpmachine | sed 's/-.*//'` &&
        break
    done
    unset MAYBECC

    [ -z "$ARCH" ] && ARCH=`uname -m`
fi

# Auto-detect a TRIPLE if not specified
if [ -z "$TRIPLE" ]
then
    case "$ARCH" in
        armhf)
            ARCH="arm"
            TRIPLE="$ARCH-linux-musleabihf"
            ;;

        arm*)
            TRIPLE="$ARCH-linux-musleabi"
            ;;

        x32)
            TRIPLE="x86_64-x32-linux-musl"
            ;;

        *)
            TRIPLE="$ARCH-linux-musl"
            ;;
    esac
fi

PREFIX="$PWD/tools/$TRIPLE"

PATH="$PREFIX/bin:$PATH"

export PREFIX PATH TRIPLE
echo "TRIPLE: $TRIPLE"
echo "PREFIX: $PREFIX"
echo "PATH: $PATH"

# make the sysroot usr directory
if [ ! -e "$PREFIX"/"$TRIPLE"/usr ]
then
    mkdir -p "$PREFIX"/"$TRIPLE"
    ln -sf . "$PREFIX"/"$TRIPLE"/usr
fi

# Get our Linux arch and defconfig
LINUX_ARCH=`echo "$ARCH" | sed 's/-.*//'`
LINUX_DEFCONFIG=defconfig
case "$LINUX_ARCH" in
    i*86) LINUX_ARCH=i386 ;;
    x32) LINUX_ARCH=x86_64 ;;
    arm*) LINUX_ARCH=arm ;;
    aarch64*) LINUX_ARCH=arm64 ;;
    mips*) LINUX_ARCH=mips ;;
    or1k*) LINUX_ARCH=openrisc ;;
    sh*) LINUX_ARCH=sh ;;

    powerpc* | ppc*)
        LINUX_ARCH=powerpc
        LINUX_DEFCONFIG=g5_defconfig
        ;;

    microblaze)
        LINUX_DEFCONFIG=mmu_defconfig
	;;
esac
export LINUX_ARCH

# Get the target-specific multilib option, if applicable
GCC_MULTILIB_CONFFLAGS="--disable-multilib --with-multilib-list="
if [ "$ARCH" = "x32" ]
then
    GCC_MULTILIB_CONFFLAGS="--with-multilib-list=mx32"
fi

cd binutils
make pass1

cd ../../gcc
make pass1

