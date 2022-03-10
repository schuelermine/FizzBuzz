{-# LANGUAGE ViewPatterns #-}
module Main where

import Lib
import System.Environment (getArgs)

main :: IO ()
main = do
    (map (read @Integer) -> arg:_) <- getArgs
    putStrLn $ fizzbuzz arg