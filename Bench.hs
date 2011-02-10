module Main where

import Control.DeepSeq
import Criterion.Main (bench, bgroup, nf)
import Env
import Parser
import Progression.Main

file :: FilePath
file = "input.texi"

main :: IO ()
main = do
    cs <- readF file
    defaultMain $ do
        bgroup "" [
            bench "samp" $ nf parseSamp cs
          ]
