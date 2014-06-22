#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'scores', new Scores()
    @set 'curScore', new Score()
    @get('scores').add(@get('curScore'))

    # @set 'username', @getUsername()
    # @get('playerHand').username(@get('username'))
  
    @get('playerHand').on 'bust', =>
      playerScore = @get('playerHand').maxScores()
      dealerScore = @get('dealerHand').maxScores()
      roundNumber = @get('scores').countRounds()
      @get('curScore').winnerSelect(playerScore, dealerScore, roundNumber)
      
    # @get('dealerHand').on 'bust', =>
    #   @get('curScore').bust 'dealer'

    @get('playerHand').on 'stand', =>
      @get('dealerHand').dealerPlay()

    @get('dealerHand').on 'bust dealerFinish', =>
      playerScore = @get('playerHand').maxScores()
      dealerScore = @get('dealerHand').maxScores()
      roundNumber = @get('scores').countRounds()
      @get('curScore').winnerSelect(playerScore, dealerScore, roundNumber)

    # @get('scoreBoard').on 'winnerChosen', ->
 
    
    @get('playerHand').on "restart", => 
      @get('playerHand').newGame();
    

  createScoreBoard: =>
    @set 'scoreBoard', new Score() if not @get 'scoreBoard'
  
  # getUsername: ->
  #   unless /(&|\?)username=/.test(window.location.search)
  #     newSearch = window.location.search
  #     newSearch += "&"  if newSearch isnt "" & newSearch isnt "?"
  #     newSearch += "username=" + (prompt("What is your name?") or "anonymous")
  #     username = newSearch.split('=')[1];
  #     username
