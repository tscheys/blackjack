class window.CardView extends Backbone.View
  className: 'card'

  # rank: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  # ace: ace, 2 ... 10 jack, queen, king
  # suit: [0,1,2,3]: Spades, Diamonds, Hearts, Clubs
  # {rank}-{suit}.png
  template: _.template '<img class="card" src="./img/cards/<%= rankName %>-<%= suitName %>.png"><%= rankName %> of <%= suitName %>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'

