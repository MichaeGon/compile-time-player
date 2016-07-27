{-# LANGUAGE TemplateHaskell, QuasiQuotes #-}

module CYT
    ( playQ
    ) where

import Language.Haskell.TH
import System.Process

import CYT.Core

playQ :: DecsQ
playQ = runIO ioAction >> [d| dummy = undefined |]
    where
        ioAction = createProcess playOnMac
