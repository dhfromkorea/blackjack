class window.ScoreEntryView extends Backbone.View
  

  tagName: 'tr'

  #todo: switch to mustache
  template: _.template "<td><%= roundNumber %></td><td><%= result %></td><td><%= playerFinalScore %></td><td><%= dealerFinalScore %></td>"

  initialize: ->
    @render()
    @model.on 'change', =>
      @render()

  render: =>
  	@$el.html @template @model.attributes