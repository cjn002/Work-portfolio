runningScoreFn = function(pointHistory){
  playerUni = sort(unique(pointHistory))
  cols = sapply(playerUni, function(thisPlayer){
    cumsum(pointHistory == thisPlayer)
  })
  names(cols) = playerUni
  cbind(pointHistory, as.data.frame(cols))
}

pRogerPoint = 0.6
whoWinsGameFn = function(pRogerPoint, winBy, winningScore){
  pointHistory = c()
  i = 1
  repeat{
    AndyPoints = 0
    RogerPoints = 0
    pointHistory[i] <- sample(c('r', 'a'), 1, replace = T, prob = c(pRogerPoint, 1 - pRogerPoint))
    i <- i + 1
    for(i in c(1:i)){
      ifelse(pointHistory[i] == 'a', AndyPoints <- AndyPoints + 1, RogerPoints <- RogerPoints + 1)
    }
    if(AndyPoints >= winningScore & abs(AndyPoints - RogerPoints) >= winBy) break
    if(RogerPoints >= winningScore & abs(AndyPoints - RogerPoints) >= winBy) break
  }
  winner = ''
  ifelse(AndyPoints > RogerPoints, winner <- 'Andy', winner <- 'Roger')
  list(runningScore = runningScoreFn(pointHistory), Winner = winner)
}
whoWinsGameFn(pRogerPoint = 0.6, winBy = 2, winningScore = 4)

rogerWinsGameFn = function(pRogerPoint){
  pointHistory = c()
  i = 1
  repeat{
    AndyPoints = 0
    RogerPoints = 0
    pointHistory[i] <- sample(c('r', 'a'), 1, replace = T, prob = c(pRogerPoint, 1 - pRogerPoint))
    i <- i + 1
    for(i in c(1:i)){
      ifelse(pointHistory[i] == 'a', AndyPoints <- AndyPoints + 1, RogerPoints <- RogerPoints + 1)
    }
    if(AndyPoints >= 4 & abs(AndyPoints - RogerPoints) >= 2) break
    if(RogerPoints >= 4 & abs(AndyPoints - RogerPoints) >= 2) break
  }
  winner = ''
  ifelse(AndyPoints > RogerPoints, winner <- 'Andy', winner <- 'Roger')
  RogerWins <- winner == 'Roger'
  data.frame(AndyPoints, RogerPoints, RogerWins)
}
rogerWinsGameFn(pRogerPoint = 0.6)

#A. pRogerGame
gameResult <- table(replicate(1000, rogerWinsGameFn(pRogerPoint = 0.6)$RogerWins))
pRogerGame <- gameResult[2] / 1000
pRogerGame

rogerWinsSetFn = function(pRogerGame){
  gameHistory = c()
  i = 1
  repeat{
    AndyGames = 0
    RogerGames = 0
    gameHistory[i] <- sample(c('r', 'a'), 1, replace = T, prob = c(pRogerGame, 1 - pRogerGame))
    i <- i + 1
    for(i in c(1:i)){
      ifelse(gameHistory[i] == 'a', AndyGames <- AndyGames + 1, RogerGames <- RogerGames + 1)
    }
    if(AndyGames >= 6 & abs(AndyGames - RogerGames) >= 2) break
    if(RogerGames >= 6 & abs(AndyGames - RogerGames) >= 2) break
  }
  winner = ''
  ifelse(AndyGames > RogerGames, winner <- 'Andy', winner <- 'Roger')
  RogerWins <- winner == 'Roger'
  data.frame(AndyGames, RogerGames, RogerWins)
}
rogerWinsSetFn(pRogerGame = 0.712)

#B. pRogerSet
setResult <- table(replicate(1000, rogerWinsSetFn(pRogerGame = 0.712)$RogerWins))
pRogerSet <- setResult[2] / 1000
pRogerSet

rogerWinsMatchFn = function(pRogerSet){
  setHistory = c()
  i = 1
  repeat{
    AndySets = 0
    RogerSets = 0
    setHistory[i] <- sample(c('r', 'a'), 1, replace = T, prob = c(pRogerSet, 1 - pRogerSet))
    i <- i + 1
    for(i in c(1:i)){
      ifelse(setHistory[i] == 'a', AndySets <- AndySets + 1, RogerSets <- RogerSets + 1)
    }
    if(RogerSets == 3 | AndySets == 3) break
  }
  winner = ''
  ifelse(AndySets > RogerSets, winner <- 'Andy', winner <- 'Roger')
  RogerWins <- winner == 'Roger'
  data.frame(AndySets, RogerSets, RogerWins)
}
rogerWinsMatchFn(pRogerSet = 0.953)

#C. pRogerMatch
matchResult <- table(replicate(1000, rogerWinsMatchFn(pRogerSet = 0.953)$RogerWins))
pRogerMatch <- matchResult[2] / 1000
pRogerMatch