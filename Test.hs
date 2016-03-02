{-# LANGUAGE ForeignFunctionInterface #-}
module Test where
 
import Foreign.C.Types
import Foreign.C.String
 
add :: Num a => a -> a -> a
add x y = x + y


f1 :: CInt -> IO CInt
f1 x = do
    return (42 + x)
 
f2 :: CFloat -> IO CFloat
f2 x = do
    return (10.0 + x)

f3 :: CFloat -> IO CFloat
f3 x = do
    return (add 10.0 x)
    
f4 :: CString -> IO CString
f4 s = do
    w <- peekCString s
    newCString (w  ++ " world!")

foreign export ccall
    f1 :: CInt -> IO CInt

foreign export ccall
    f2 :: CFloat -> IO CFloat

foreign export ccall
    f3 :: CFloat -> IO CFloat

foreign export ccall
    f4 :: CString -> IO CString
