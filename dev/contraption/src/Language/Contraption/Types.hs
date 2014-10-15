

{- |
Module      :  Contraption.Types
Description :  Contraption.Types 
Copyright   :  (c) Plow Technologies
License     :  MIT License
Maintainer  :  Scott Murphy
Stability   :  unstable 
Portability :   non-portable (System.Posix)


-}



{-# LANGUAGE DataKinds                 #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE FlexibleInstances         #-}
{-# LANGUAGE GADTs                     #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE OverloadedStrings         #-}
{-# LANGUAGE PolyKinds                 #-}
{-# LANGUAGE TemplateHaskell           #-}
{-# LANGUAGE TypeFamilies              #-}
{-# LANGUAGE TypeOperators             #-}
{-# LANGUAGE TypeSynonymInstances      #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Language.Contraption.Types  where

import BasicPrelude
-- import Data.Vinyl
-- import           Data.Vinyl.Functor
-- import           Data.Vinyl.Idiom.Identity
-- import           Data.Vinyl.Idiom.Validation
import           Data.Vinyl.TH
import           Language.Contraption.Internal (mkSemantics)
-- import           Data.Vinyl.TyFun
-- import           Data.Vinyl.Witnesses

import Data.Singletons.TH
data Fields = LocationId | LocalId |TagId | Description | LastUpdate | Rslt deriving Show
genSingletons [ ''Fields ]
makeUniverse' ''Fields "TFU"
-- semantics ''TFU [  'LocationId :~> ''Int
--                 ,  'LocalId    :~> ''Int
--                 ,  'TagId      :~> ''Int                   
--                 ,  'Description :~> ''Text
--                 ,  'LastUpdate  :~> ''Int
--                 ,  'Rslt       :~> ''Text
--                 ] 

semList = mkSemantics 'TFU (zip fields types)
  where
   fields = [ 'LocationId, 'LocalId, 'TagId, 'Description , 'LastUpdate, 'Rslt]
   types  = [ ''Int      , ''Int  , ''Int , ''Text ,       ''Int    ,   ''Text]






