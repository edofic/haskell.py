from ctypes import *

lib = cdll.LoadLibrary('./Test.so')

funcs = {
#    name   restype    argtypes    input  expected value
    'f1':   (c_int,    [c_int],    (10,   52)),
    'f2':   (c_float,  [c_float],  (10.0, 20.0)),
    'f3':   (c_float,  [c_float],  (11.0, 21.0)),
    'f4':   (c_char_p, [c_char_p], ("hello", "hello world!")),
}

for func in funcs:
    f = getattr(lib, func)
    f.restype, f.argtypes, test = funcs[func]
    input, expected = test
    assert f(input) == expected
    print('{0}({1}) == {2}'.format(func, input, expected))
