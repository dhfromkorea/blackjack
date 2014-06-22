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
    roundNumber: 'new'

  initialize: ->

  
  winnerSelect: (playerScore, dealerScore, roundNumber) ->
    @set 'playerFinalScore', playerScore
    @set 'dealerFinalScore', dealerScore
    @set 'roundNumber', roundNumber
    
    playerFinalScore = @get 'playerFinalScore'
    dealerFinalScore = @get 'dealerFinalScore'
    # out of bounds cases
    if dealerFinalScore >= 22 and playerFinalScore < 22
      @set 'result', 'victory'
      @set 'dealerFinalScore', 'busted'
      @trigger 'playerWin'
    else if playerFinalScore >= 22 and dealerFinalScore < 22
      @set 'result', 'defeat'
      @set 'playerFinalScore', 'busted'
      @trigger 'playerLost'
    # black jack
    else if playerFinalScore is 21 and dealerFinalScore isnt 21
      @set 'result', 'victory'
      @set 'playerFinalScore', 'blackjack'
    else if dealerFinalScore is 21 and playerFinalScore isnt 21
      @set 'result', 'defeat'
      @set 'dealerFinalScore', 'blackjack'
    # draw
    else if playerFinalScore is dealerFinalScore
      @set 'result', 'draw'
      @trigger 'playerDraw'
    # the rest of the cases
    else if playerFinalScore > dealerFinalScore
      @set 'result', 'victory'
      @trigger 'playerWin'
    else if playerFinalScore < dealerFinalScore
      @set 'result', 'defeat'
      @trigger 'playerLost'
    @trigger 'winnerChosen'

  newGame: ->
    newCount = @get 'playCount'
    @set 'playCount', newCount

  # bust: (who)->
  #   who = who + 'bust'
  # 	@trigger who , @