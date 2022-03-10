{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE BlockArguments #-}
module Lib where
import Data.Maybe
import Data.Bifunctor

fizzbuzz :: Integer -> String
fizzbuzz = fz [(3,"Fizz"),(5,"Buzz")]

bar :: [(Integer, c)] -> [(Integer -> Bool, c)]
bar rs = map (first @(,) (\m n -> n % m == 0)) rs

fz :: [(Integer, String)] -> Integer -> String
fz rs n = foo (bar rs) (<>) (show n) n

foldApp :: (c -> b -> c) -> [a -> b] -> c -> a -> c
foldApp g fs x y = foldl g x (map ($ y) fs)

foldEx :: (c -> c -> c) -> c -> [c] -> c
foldEx f e = let f' (False, a) (True, b) = (True, b)
                 f' (True, a) (True, b) = (True, f a b)
             in snd . foldl f' (False, e) . map (True,)

toMaybe :: Bool -> a -> Maybe a
toMaybe False _ = Nothing
toMaybe True  x = Just x

foo :: [(p -> Bool, c)] -> (c -> c -> c) -> c -> p -> c
foo rs g e n = let i = catMaybes (map (\(rf, rx) -> toMaybe (rf n) rx) rs)
    in foldEx g e i

(%) :: Integer -> Integer -> Integer
(%) = mod