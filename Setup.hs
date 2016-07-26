import Distribution.Simple

import MP3Hooks

main :: IO ()
main = playMp3 >> defaultMain >> stopMp3
