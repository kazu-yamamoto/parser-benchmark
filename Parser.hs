module Parser where

import Control.Applicative hiding ((<|>), many)
import Env

samps :: Parser [String]
samps = appear samp

samp :: Parser String
samp = string "@samp{" *> many1 (noneOf "}") <* char '}'

{- extract all strings matched to a pattern -}
appear :: Parser a -> Parser [a]
appear p = (:) <$> try p <*> appear p
       <|> anyChar *> appear p
       <|> [] <$ eof

parseSamp :: Input -> [String]
parseSamp = doParse samps
