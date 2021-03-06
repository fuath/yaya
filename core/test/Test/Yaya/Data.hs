{-# LANGUAGE TemplateHaskell #-}

module Test.Yaya.Data where

import           Hedgehog
import qualified Hedgehog.Gen as Gen

import           Yaya
import           Yaya.Hedgehog.Control
import           Yaya.Hedgehog.Data
import           Yaya.Hedgehog.Expr

prop_muCataCancel :: Property
prop_muCataCancel =
  property $ law_cataCancel size =<< forAll (genExpr (Gen.sized genMuExpr))

prop_muCataRefl :: Property
prop_muCataRefl =
  property $ law_cataRefl =<< forAll (Gen.sized genMuExpr)

-- prop_muCataCompose :: Property
-- prop_muCataCompose =
--   property $ law_cataCompose size id =<< forAll genMuExpr

tests :: IO Bool
tests = checkParallel $$(discover)
