class window.AppView extends Backbone.View

  template: _.template '<div class="play-board pure-u-2-3"><div class="button-player"><button id="hit-button" class="pure-button">Hit</button><button id="stand-button" class="pure-button">Stand</button><button class="pure-button pure-button-primary restart-button">Restart</button></div><div class="player-hand-container"></div><div class="dealer-hand-container"></div></div><div class="score-board pure-u-1-3"></div>'
  
  className: 'pure-g'

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()
    "click .restart-button": -> @model.newGame()

  initialize: ->
    @render()
    @model.on 'winnerChosen', =>
      @$('#hit-button').removeClass('hit-button').addClass('disabled')
      @$('#stand-button').removeClass('stand-button').addClass('disabled')
    @model.on 'restart', => @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('#hit-button').addClass('hit-button')
    @$('#stand-button').addClass('stand-button')
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
    @$('.score-board').html new ScoreView(collection: @model.get 'scores').el



