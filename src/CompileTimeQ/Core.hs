module CompileTimeQ.Core
    ( playOnMac
    , brewConfig
    , play
    ) where

import System.Info
import System.Process

play :: CreateProcess
play = shell . unlines . br $ os
    where
        br "darwin" = playOnMac
        br "linux" = playOnLinux
        br _ = ["echo 'unknwon platform'"]

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
