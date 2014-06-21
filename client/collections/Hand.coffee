class window.Hand extends Backbone.Collection

  model: Card

  initialize: (models, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    newScore = @scores()
    hasAce = (newScore.length is 2)
    if not hasAce and newScore[0] < 22
      @last()
    else if hasAce and newScore[1] < 22
      @last()
    else if hasAce and newScore[0] < 22
      @last()
  
  username: (@username) ->
    @trigger('username', @)

  stand: ->
    @trigger('stand', @)

  restart: ->
    @trigger('restart', @)

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + card.get 'value'
      # will handle the revealing of a card later
      # score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]
