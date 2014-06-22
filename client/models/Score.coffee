# // playcount
# // scores
# // dealer
# // player
# // history score: win and lose

class window.Score extends Backbone.Model
  
  defaults:
    playerFinalScore: 0
    dealerFinalScore: 0
    result: 'unknown'
    roundNumber: 1

  initialize: ->

  
  winnerSelect: (playerScore, dealerScore, roundNumber) ->
    @set 'playerFinalScore', playerScore
    @set 'dealerFinalScore', dealerScore
    @set 'roundNumber', roundNumber
    
    playerFinalScore = @get 'playerFinalScore'
    dealerFinalScore = @get 'dealerFinalScore'

    if dealerScore > 21
      @set 'result', 'victory'
      @trigger 'playerWin'
    else if playerScore > 21
      @set 'result', 'defeat'
      @trigger 'playerLost'
    else if playerScore > dealerScore
      @set 'result', 'victory'
      @trigger 'playerWin'
    else if playerScore < dealerScore
      @set 'result', 'defeat'
      @trigger 'playerLost'
    else
      @set 'result', 'draw'
      @trigger 'playerDraw'
    @trigger 'winnerChosen'

  newGame: ->
    newCount = @get 'playCount'
    @set 'playCount', newCount

  # bust: (who)->
  #   who = who + 'bust'
  # 	@trigger who , @