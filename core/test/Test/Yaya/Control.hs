{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}

module Test.Yaya.Control where

import           Hedgehog

tests :: IO Bool
tests = checkParallel $$(discover)
