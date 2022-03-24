{-# LANGUAGE ViewPatterns #-}
module Main where

import Lib
import System.Environment (getArgs)

main :: IO ()
main = do
    ((read @Integer <$>) -> arg:_) <- getArgs
    putStrLn $ fizzbuzz arg
