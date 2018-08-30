{-@ LIQUID "--no-termination" @-}

module Main where

main :: IO ()
main = putStrLn "Refinement types"

data GlasType = Tumbler
              | Cocktail
              | Highball

{-@ measure maxOz @-}
maxOz :: GlasType -> Int
maxOz Tumbler = 10
maxOz Cocktail = 5
maxOz Highball = 15

{-@ type GlasTypeN N = {v: GlasType | N == maxOz v} @-}

{-@ bigDrinkGlas :: GlasTypeN 15 @-}
bigDrinkGlas = Highball

{-
{-@ bigDrinkGlasWrong :: GlasTypeN 15 @-}
bigDrinkGlasWrong = Cocktail
-}

data Drink = Negroni
           | GinTonic

{-@ measure glas @-}
glas :: Drink -> GlasType
glas Negroni = Tumbler
glas GinTonic = Highball

{-@ type DrinkR T = {v: Drink | T == glas v} @-}

{-@ validNegroni :: DrinkR Tumbler @-}
validNegroni = Negroni :: Drink

{-
{-@ wrongNegroni :: DrinkR Highball @-}
wrongNegroni = Negroni :: Drink
-}

data Ingredient = Rum

data Ounce = Oz Ingredient

data ShakerType = Boston

{-@ measure shakerTypeOz @-}
shakerTypeOz :: ShakerType -> Int
shakerTypeOz Boston = 2

{-@ type ShakerTypeN N = {v: ShakerType | N == shakerTypeOz v} @-}

{-@ validBoston :: ShakerTypeN 2 @-}
validBoston = Boston

{-
{-@ nonValidBoston :: ShakerTypeN 5 @-}
nonValidBoston = Boston
-}

data Shaker = Empty
            | Mix Int Ounce Shaker

{-@ measure size @-}
size :: Shaker -> Int
size Empty = 0
size (Mix amount oz s) = size s + amount

{-@ type ShakerN ST = {v: Shaker | size v <= shakerTypeOz ST } @-}

{-@ shaker0 :: ShakerN Boston @-}
shaker0 = Empty

{-@ shaker1 :: ShakerN Boston @-}
shaker1 = Mix 1 (Oz Rum) Empty

{-@ shaker2 :: ShakerN Boston @-}
shaker2 = Mix 1 (Oz Rum) (Mix 1 (Oz Rum) Empty)

{-
{-@ shaker3 :: ShakerN Boston @-}
shaker3 = Mix (Oz Rum) (Mix (Oz Rum) (Mix (Oz Rum) Empty)) -- will fail
-}