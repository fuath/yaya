import           Control.Monad
import           System.Exit (exitFailure)
import           System.IO (BufferMode(..), hSetBuffering, stdout, stderr)

import qualified Test.Yaya.Unsafe.Control as Control
import qualified Test.Yaya.Unsafe.Data as Data

main :: IO ()
main = do
  hSetBuffering stdout LineBuffering
  hSetBuffering stderr LineBuffering

  results <- sequence [ Control.tests
                      , Data.tests
                      ]

  unless (and results) exitFailure
