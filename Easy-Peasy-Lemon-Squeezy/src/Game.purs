-- | This is the entry point to the game, and contains the main game logic.
module Main where
  import Prelude (Unit, (++))

  import Control.Monad.Eff(Eff())
  import Data.Either(Either(..))

  import Game.State (CharacterStatus(..), State, startingStats)
  import Game.Input (Input(Drop, Take, Look), parse)
  import Game.Driver (GAME, Game, runGame)

  myGame :: Game State Input
  myGame = { initial: initial, describe: describe, parse: parse, update: update }
    where
      -- EXERCISE SET 4 (1/2)
      -- Add initial values to the newly-added fields in State:
      initial :: State
      initial = { playerStatus : Hungry, playerStats : startingStats }

      -- EXERCISE SET 4 (2/2)
      -- Describe the player's status and (optionally) stats.
      describe :: State -> String
      describe ({ playerStatus : Hungry  }) = "You are standing no where, with nothing around, and you are really, really hungry."
      describe ({ playerStatus : Tired   }) = "You are standing no where, with nothing around, and you are really, really tired."
      describe ({ playerStatus : Content }) = "You are standing no where, with nothing around, and you are happy enough."

      update :: State -> Input -> Either String State
      update s Look = Right s
      update s (Take v) = Left ("There is no " ++ v ++ " to take!")
      update s (Drop v) = Left ("You are not carrying a " ++ v ++ "!")

  main :: Eff ( game :: GAME ) Unit
  main = runGame myGame
