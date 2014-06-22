class window.ScoreView extends Backbone.View

  className: 'score-board pure-table' 
  
  tagName: 'table'

  #todo: switch to mustache
  template: _.template "<thead><tr><th>round</th><th>result</th><th>playerFinalScore</th><th>dealerFinalScore</th></tr></thead>"
  
  initialize: ->
    # @collection.on 'change', => @render()
    @render()

  render: ->
    @$el.children().detach()    
    @$el.html @template @collection
    @$el.append @collection.map (scoreModel) -> 
      new ScoreEntryView(model: scoreModel).$el

    # @$('.score').text @collection.scores()[0]


