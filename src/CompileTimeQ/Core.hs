module CompileTimeQ.Core
    ( playOnMac
    , brewConfig
    , play
    ) where

import Control.Monad
import System.Directory
import System.Info
import System.IO
import System.IO.Temp
import System.Process

play :: IO ()
play
    | os == "darwin" = void . createProcess . shell . unlines $ playOnMac
    | os == "linux" = undefined
    | otherwise = putStrLn $ "unknown platform: " `mappend` os 

playOnLinux :: [String]
playOnLinux = undefined

playOnMac :: [String]
playOnMac = brewConfig' `mappend` play'

brewConfig' :: [String]
brewConfig' = [
    "ytdl=youtube-dl",
    "res=`brew list | grep ${ytdl}`",
    "if [ \"${res}\" != ${ytdl} ]; then",
    "echo 'configure...'",
    "brew install ${ytdl}",
    {-
    "else",
    "youtube-dl -U",
    "echo 'configure...'",
    -}
    "fi",
    "mpr=mplayer",
    "res2=`brew list | grep ${mpr}`",
    "if [ \"${res2}\" != ${mpr} ]; then",
    "brew install ${mpr}",
    "fi",
    "echo 'done'"]

brewConfig :: CreateProcess
brewConfig = shell . unlines $ brewConfig'

play' :: [String]
play' = [
    "geko='https://www.youtube.com/watch?v=OxXzOA784X8'",
    "youtube-dl ${geko} -q -o - | mplayer - -novideo"]

{-}
play :: CreateProcess
play = shell . unlines $ play'
-}
