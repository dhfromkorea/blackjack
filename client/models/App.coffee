#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    
    @set 'playCurScore', 0
    @set 'dealCurScore', 0
    
    @get('playerHand').on "add", (->
      newScore = @get('playerHand').scores()[0]
      @set 'playCurScore', newScore), this
    
    @get('dealerHand').on "add", (->      
      newScore = @get('dealerHand').scores()[0]
      @set 'dealCurScore', newScore), this

    @.on "change:playCurScore", (->
      alert('bust') if @get('playCurScore') > 21 ), this

    @.on "change:dealCurScore", (->
      alert('bust') if @get('dealCurScore') > 21 ), this
    
    @get('playerHand').on "stand", (-> 
      @get('dealerHand').hit() while @get('dealerHand').scores()[0] < 18
    ), this
