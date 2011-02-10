module Parser where

import Control.Applicative hiding ((<|>), many)
import Env

targets :: Parser [String]
targets = appear target

target :: Parser String
target = string "tre"

{- extract all strings matched to a pattern -}
appear :: Parser a -> Parser [a]
appear p = (:) <$> try p <*> appear p
       <|> anyChar *> appear p
       <|> [] <$ eof

parseTarget :: Input -> [String]
parseTarget = doParse targets
