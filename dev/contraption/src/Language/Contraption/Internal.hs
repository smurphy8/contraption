
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


module Language.Contraption.Internal
    (
      mkSemantics
    ) where

import           BasicPrelude
import           Data.Vinyl.TH

mkSemantics n s = semantics n (map semBuilder s)
  where
     semBuilder (c, t) = c :~> t



