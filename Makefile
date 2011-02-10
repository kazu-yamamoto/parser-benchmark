all:
	ghc --make -O2 -o Bench -hide-package parsec -DMETHOD=$(METHOD) Bench.hs

clean:
	rm -f Bench *.hi *.o

distclean:
	make clean
	rm -f *.csv *.png
