{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module NOM.State.CacheId where

import Relude

import Data.MemoTrie (HasTrie (..))

newtype CacheId b = MkCacheId {unCacheId :: Int}
  deriving stock (Show, Eq, Ord, Read, Generic)
  deriving newtype (NFData)

instance HasTrie (CacheId b) where
  newtype CacheId b :->: c = CacheIdTrie {unCacheIdTrie :: Int :->: c}
  trie = coerce (trie @Int)
  untrie = coerce (untrie @Int)
  enumerate = coerce (enumerate @Int)