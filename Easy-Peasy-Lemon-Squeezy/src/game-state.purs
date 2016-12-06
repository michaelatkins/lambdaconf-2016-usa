module Game.State where
  -- EXERCISE SET 1 (1/2):
  data CharacterStatus = Content | Hungry | Tired

  -- EXERCISE SET 1 (2/2):
  describeCharacterStatus :: CharacterStatus -> String
  describeCharacterStatus Content = "You are content."
  describeCharacterStatus Hungry  = "You are feeling very hungry."
  describeCharacterStatus Tired   = "You need to sleep soon."

  -- EXERCISE SET 2 (1/3):
  data CharacterStats = CharacterStats Health Strength

  -- EXERCISE SET 2 (2/3):
  startingStats :: CharacterStats
  startingStats = CharacterStats (Health 100) (Strength 100)

  -- EXERCISE SET 2 (3/3):
  healthOf :: CharacterStats -> Int
  healthOf (CharacterStats (Health health) _) = health

  strengthOf :: CharacterStats -> Int
  strengthOf (CharacterStats _ (Strength strength)) = strength

  -- EXERCISE SET 3 (1/3):
  data Monster = Wolf CharacterStats | Ogre CharacterStats

  -- EXERCISE SET 3 (2/3):
  bigBadWolf :: Monster
  bigBadWolf = Wolf (CharacterStats (Health 200) (Strength 200))

  fearfulOgre :: Monster
  fearfulOgre = Ogre (CharacterStats (Health 10) (Strength 500))

  -- EXERCISE SET 3 (3/3):
  monsterStrength :: Monster -> Int
  monsterStrength (Wolf (CharacterStats _ (Strength s))) = s
  monsterStrength (Ogre (CharacterStats _ (Strength s))) = s

  -- EXERCISE SET 4 (1/2)
  type State = {
    playerStatus :: CharacterStatus,
    playerStats  :: CharacterStats }

  -- EXERCISE SET 5 (1/2)
  -- Define `defeats` type:
  -- defeats :: ???

  -- EXERCISE SET 5 (2/2)
  -- Implement `defeats` with lambda:
  -- defeats = ???

  -- EXERCISE SET 6 (1/2)
  newtype Health = Health Int
  newtype Strength = Strength Int

  -- EXERCISE SET 7 (2/2)
  -- type StatsModifier = ???

  -- EXERCISE SET 8 (1/2)
  -- data Inventory a b = ???

  -- EXERCISE SET 8 (1/2)
  -- isEmpty :: ???

  -- EXERCISE SET 9 (1/2)
  -- type NonPlayerCharacter = ???
  -- type Item = ???
  -- type PlayerCharacter = ???

  -- EXERCISE SET 9 (2/2)
  -- getName :: ???
  -- getName r = r.name

  -- EXERCISE SET 10 (1/3)
  -- data Location = ???

  -- EXERCISE SET 10 (2/3)
  -- data Connection = ???

  -- EXERCISE SET 10 (3/3)
  -- gameMap :: List Connection

  -- EXERCISE SET 11 (1/3)
  -- class Describable a where
  --   ???

  -- EXERCISE SET 11 (2/3)
  -- data Weapon = ???

  -- EXERCISE SET 11 (3/3)
  -- instance describableWeapon :: Describable Weapon where
  --   ???

-- | This is the module responsible for parsing user input, and converting input
-- | into data types that are easier to work with than raw strings.
-- |
-- | You can add more commands to the game here.
