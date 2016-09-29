{-# LANGUAGE TemplateHaskell #-}

module Assist
    ( dummy
    ) where

import CYT

$(playQ)
