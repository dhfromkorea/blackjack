class window.Scores extends Backbone.Collection

  model: Score

  initialize: ->
    @.on 'add', ->
      @trigger 'newGame'

  countRounds: ->
  	@models.length