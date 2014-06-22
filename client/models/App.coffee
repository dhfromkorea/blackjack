#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @setUpBoard()
    @addListener()

  
  getScores: -> 
    result = []
    result.push @get('playerHand').maxScores()
    result.push @get('dealerHand').maxScores()
    result.push @get('scores').countRounds()
    result

  newGame: =>
    @setUpBoard()
    @addListener()
    @trigger 'restart', @
  
  setUpBoard: =>
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'curScore', new Score()
    @get('scores').add(@get('curScore'))

  addListener: =>
    @get('playerHand').on 'bust', =>
      playerScore = @getScores()[0]
      dealerScore = @getScores()[1]
      roundNumber = @getScores()[2]
      @get('curScore').winnerSelect(playerScore, dealerScore, roundNumber)

    @get('playerHand').on 'stand', =>
      @get('dealerHand').dealerPlay()

    @get('dealerHand').on 'bust dealerFinish', =>
      playerScore = @getScores()[0]
      dealerScore = @getScores()[1]
      roundNumber = @getScores()[2]
      @get('curScore').winnerSelect(playerScore, dealerScore, roundNumber)
    
    @get('curScore').on 'winnerChosen', =>
       @trigger 'winnerChosen'

  # getUsername: ->
  #   unless /(&|\?)username=/.test(window.location.search)
  #     newSearch = window.location.search
  #     newSearch += "&"  if newSearch isnt "" & newSearch isnt "?"
  #     newSearch += "username=" + (prompt("What is your name?") or "anonymous")
  #     username = newSearch.split('=')[1];
  #     username
