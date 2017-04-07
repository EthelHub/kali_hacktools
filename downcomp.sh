#!/bin/sh
wget -O $1.c https://www.exploit-db.com/download/$1
i686-w64-mingw32-gcc $1.c -o $1.exe -lws2_32
