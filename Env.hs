{-# LANGUAGE CPP #-}

module Env (
    string, many1, noneOf, char, anyChar, eof, try
  , (<|>), doParse
  , Parser, Input
  , readF
  ) where

#ifdef METHOD == 1
import System.IO
import Text.Parsec
import Text.Parsec.String
type Input = String

readF :: String -> IO Input
readF = readFile

doParse :: Parser a -> Input -> a
doParse p cs = case parse p "parsec-string" cs of
    Left  e -> error . show $ e
    Right r -> r

#elif  METHOD == 2
import Text.Parsec
import Text.Parsec.ByteString.Lazy
import Data.ByteString.Lazy as T
type Input = T.ByteString

readF :: String -> IO Input
readF = T.readFile

doParse :: Parser a -> Input -> a
doParse p cs = case parse p "parsec-bytestring" cs of
    Left  e -> error . show $ e
    Right r -> r

#elif  METHOD == 3
import Text.Parsec
import Text.Parsec.Text.Lazy
import Data.Text.Lazy as T
import Data.Text.Lazy.IO as T
type Input = T.Text

readF :: String -> IO Input
readF = T.readFile

doParse :: Parser a -> Input -> a
doParse p cs = case parse p "parsec-text" cs of
    Left  e -> error . show $ e
    Right r -> r

#else
{- default -}
import System.IO
import Text.Parsec
import Text.Parsec.String
type Input = String

readF :: String -> IO Input
readF = readFile

doParse :: Parser a -> Input -> a
doParse p cs = case parse p "parsec-string" cs of
    Left  e -> error . show $ e
    Right r -> r
#endif

