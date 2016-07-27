module CYT.Core
    ( brewConfig
    , play
    ) where

import System.Process

brewConfig :: CreateProcess
brewConfig = shell . unlines $ [
    "ytdl=youtube-dl",
    "res=`brew list | grep ${ytdl}`",
    "echo 'configure...'",
    "if [ \"${res}\" != ${ytdl} ]; then",
    "brew install ${ytdl}",
    "fi",
    "mpr=mplayer",
    "res2=`brew list | grep ${mpr}`",
    "if [ \"${res2}\" != ${mpr} ]; then",
    "brew install ${mpr}",
    "fi",
    "echo 'done'"]

play :: CreateProcess
play = shell . unlines $ [
    "geko='https://www.youtube.com/watch?v=OxXzOA784X8'",
    "youtube-dl ${geko} -o - | mplayer - -novideo"]
