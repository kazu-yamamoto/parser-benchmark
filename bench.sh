#! /bin/sh

make distclean

make clean
make SCHEME=1
sleep 30
./Bench -m run --compare= --name=parsec-string

make clean
make SCHEME=2
sleep 30
./Bench -m run --compare= --name=parsec-bytestring

make clean
make SCHEME=3
sleep 30
./Bench -m run --compare= --name=parsec-text

./Bench -m graph --compare=parsec-string,parsec-bytestring,parsec-text
