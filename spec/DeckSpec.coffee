assert = chai.assert

describe 'deck', ->
  deck = null
  playerHand = null
  dealerHand = null

  beforeEach ->
    deck = new Deck()
    playerHand = deck.dealPlayer()
    dealerHand = deck.dealDealer()

  describe 'hit', ->
    it "should give the last card from the deck", ->
      assert.strictEqual deck.last(), playerHand.hit()

  describe 'initialize', ->
    it "should deal 2 cards to a player and a dealer respectively at the outset", ->
      assert.strictEqual deck.length, 48

  describe 'dealer', ->
    it "should play his hand until his total is 17 or greater", ->
      assert.strictEqual dealerHand.scores()[0] >= 17, true




describe 'player', ->
  deck = null
  playerHand = null
  dealerHand = null

  beforeEach ->
    deck = new Deck()
    playerHand = deck.dealPlayer()
    dealerHand = deck.dealDealer()

  describe 'player', ->
    it "should pick up a card and add it to his hand when hitting", ->
      assert.strictEqual playerHand.scores()[0] >= 17, true

  describe 'ace', ->
    xit "should handle ace in two ways", ->
      assert.strictEqual playerHand.scores()[0] >= 17, false

  describe 'bust', ->
    xit "should alert on bust when anyone's hand goes over 21", ->
      assert.strictEqual playerHand.scores()[0] >= 17, true
  
  describe 'turn', ->
    xit "should take turns deciding whether to stand or hit", ->
      assert.strictEqual playerHand.scores()[0] >= 17, true

describe 'dealer', ->
  deck = null
  playerHand = null
  dealerHand = null

  beforeEach ->
    deck = new Deck()
    playerHand = deck.dealPlayer()
    dealerHand = deck.dealDealer()  
  
  describe 'keep a card hidden', ->
    xit "dealer should start playing his card when a player stand", ->
      assert.strictEqual playerHand.scores()[0] >= 17, true

  describe 'start playing a card', ->
    xit "dealer should start playing his card when a player stand", ->
      assert.strictEqual playerHand.scores()[0] >= 17, true

  describe 'open a flipped card', ->
    xit "dealer should start playing his card when a player stand", ->
      assert.strictEqual playerHand.scores()[0] >= 17, true


describe 'etc', ->
  deck = null
  playerHand = null
  dealerHand = null

  beforeEach ->
    deck = new Deck()
    playerHand = deck.dealPlayer()
    dealerHand = deck.dealDealer()  

  describe 'betting', ->
    xit "should be able to add betting at each turn", ->
      assert.strictEqual playerHand.scores()[0] >= 17, true

  describe 'show a card image', ->
    xit "should show the corresponding card image to the card view", ->
      assert.strictEqual playerHand.scores()[0] >= 17, true


  # describe 'hit', ->
  #   it "should give the last card from the deck", ->
  #     assert.strictEqual deck.length, 50
  #     assert.strictEqual deck.last(), hand.hit()
  #     assert.strictEqual deck.length, 49
  #     hand.playable && (assert.strictEqual deck.last(), hand.hit())
  #     hand.playable && (assert.strictEqual deck.length, 48)