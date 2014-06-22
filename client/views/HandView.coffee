class window.HandView extends Backbone.View

  className: 'hand'

  #todo: switch to mustache
  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %> You <% } %></h2>'

  initialize: ->
    @collection.on 'add remove reset change', => @render()
    @render()


  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    # @$('.score').text @collection.maxScores()

