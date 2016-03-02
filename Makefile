.PHONY: clean run

Test.so: Test.hs module_init.c
	ghc -O2 --make -shared -dynamic -fPIC -o Test.so -lHSrts_debug-ghc7.10.3 Test.hs module_init.c
	rm *.hi *.h *.o

clean:
	rm Test.so

run: Test.so test.py
	python2 test.py
