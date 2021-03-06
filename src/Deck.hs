module Deck where

import System.Random.Shuffle (shuffleM)

import Cards (Cards, Hand(..), getCards, allCards)


type Deck = Cards

numberOfDecks :: Int
numberOfDecks = 6

baseDeck :: Deck
baseDeck = concat $ take numberOfDecks $ repeat allCards

newDeck :: IO (Deck)
newDeck = shuffleM baseDeck

dealCard :: Deck -> Hand -> (Deck, Hand)
dealCard (deckTopCard:deckRest) hand =
    (deckRest, Hand (deckTopCard:getCards hand))
dealCard [] _ = error "Cannot deal a card from an empty deck."  

shouldReshuffle :: Deck -> Bool
shouldReshuffle deck = length deck < length baseDeck `div` 2

