class window.AppView extends Backbone.View

  template: _.template '<div class="hand-container"><div class="button-player"><button class="pure-button pure-button-primary hit-button">Hit</button><button class="pure-button stand-button">Stand</button><button class="pure-button restart-button">Restart</button></div><div class="player-hand-container"></div><div class="hand-cotainer dealer-hand-container"></div></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()
    "click .restart-button": -> @model.get('playerHand').restart()

  initialize: ->
    # console.log @model.get('pickWinner')()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el


