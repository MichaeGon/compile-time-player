{-# LANGUAGE TemplateHaskell, QuasiQuotes #-}

module CYT.Core where

import Language.Haskell.TH
import System.Process

$( runIO (putStrLn "hello") >> [d| dummy = undefined |])
