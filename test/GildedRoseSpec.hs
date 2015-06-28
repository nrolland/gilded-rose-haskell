{-# LANGUAGE ScopedTypeVariables #-}
module GildedRoseSpec (spec) where

import           GildedRose
import           Test.Hspec
import           Test.QuickCheck
import Control.Applicative
    
initialInventory :: GildedRose
initialInventory =
      [ Item "+5 Dexterity Vest"                          10  20
      , Item "Aged Brie"                                   2   0
      , Item "Elixir of the Mongoose"                      5   7
      , Item "Sulfuras, Hand of Ragnaros"                  0  80
      , Item "Sulfuras, Hand of Ragnaros"                (-1) 80
      , Item "Backstage passes to a TAFKAL80ETC concert"  15  20
      , Item "Backstage passes to a TAFKAL80ETC concert"  10  49
      , Item "Backstage passes to a TAFKAL80ETC concert"   5  49
      -- this conjured item does not work properly yet
      , Item "Conjured Mana Cake"                          3   6
      ]


-- instance Arbitrary Item where
--     arbitrary =  do
--                  name <- arbitrary
--                  sellIn <- arbitrary
--                  quality <- arbitrary
--                  return $ Item name sellIn quality

-- import Control.Monad
-- instance Arbitrary Item where  --orphan 
--     arbitrary =  liftM3 Item arbitrary arbitrary arbitrary


instance Arbitrary Item where
    arbitrary =  liftA3 Item (elements names) arbitrary arbitrary
                 where names = map (\(Item name _ _) -> name) initialInventory



                 
spec :: Spec
spec =
  describe "updateQuality" $ do
   it "fixme" $ property $
    \(items :: GildedRose) ->  updateQuality items == updateQuality items
