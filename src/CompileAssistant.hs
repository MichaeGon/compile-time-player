{-# LANGUAGE TemplateHaskell #-}

module CompileAssistant
    ( dummy
    ) where

import CompileTimeQ

$(playQ)
