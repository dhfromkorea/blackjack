class window.Hand extends Backbone.Collection

  model: Card

  initialize: (models, @deck, @isDealer) ->
  # every time it takes a new card
  # it checks whether the score has gone over the limit
    # @.on 'add', ->
    #   alert 'hello'
    #   @bust() if @maxScores() > 21

  hit: ->
    @add(@deck.pop())
    newScore = @maxScores()
    if newScore < 22
      @last 
    else
      @trigger 'bust'

  username: (@username) ->
    @trigger 'username'

  stand: ->
    @trigger 'stand'

  restart: ->
    @trigger 'restart'

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
  
  maxScores: ->
    curScore = @scores()
    hasAce = curScore.length is 2
    if not hasAce
      curScore
    else if curScore[1] > 21
      curScore[0]
    else
      curScore[1]

  dealerPlay: ->
    @hit() while @maxScores() < 18
    if @maxScores() < 22
      @trigger 'dealerFinish' 
    else
      @trigger 'bust'