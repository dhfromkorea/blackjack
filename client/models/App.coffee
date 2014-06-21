#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    unless /(&|\?)username=/.test(window.location.search)
      newSearch = window.location.search
      newSearch += "&"  if newSearch isnt "" & newSearch isnt "?"
      newSearch += "username=" + (prompt("What is your name?") or "anonymous")
      username = newSearch.split('=')[1];
    
    @set 'username', username
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    
    @set 'playCurScore', @get('playerHand').scores()[0]
    @set 'dealCurScore', @get('dealerHand').scores()[0]
    @get('playerHand').username(username)
    
    @get('playerHand').on "add", (->
      newScore = @get('playerHand').scores()[0]
      @set 'playCurScore', newScore), this
    
    @get('dealerHand').on "add", (->      
      newScore = @get('dealerHand').scores()[0]
      @set 'dealCurScore', newScore), this

    @.on "change:dealCurScore", (->
      setTimeout @pickWinner, 500 if @get('dealCurScore') >= 17
    ), this
    
    @get('playerHand').on "stand", (->
      @get('dealerHand').hit() while @get('dealerHand').scores()[0] < 18
    ), this
    
    @get('playerHand').on "restart", (-> 
      @get('playerHand').reset() ), this

  pickWinner: =>
    playScore = @get 'playCurScore'
    dealScore = @get 'dealCurScore'
    username = @get 'username'
    if playScore > 21
      alert "#{username} busted!"
    else if dealScore > 21
      alert "the dealer busted"
    else if playScore > dealScore
      alert "#{username} win!"
    else if playScore < dealScore
      alert "#{username} lost"
    else if playScore = dealScore
      alert "draw! that was a close match"
