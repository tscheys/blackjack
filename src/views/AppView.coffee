class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <button class="bet-button">Bet $10</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <div class="wager">Wager: <%= wager %></div>
    <div class="budget">Budget: <%= playerBudget %></div>

  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.standFunc()
    'click .bet-button' : ->  @model.makeWager()

  initialize: ->
    @render()
    @listenTo @model, 'change', @render
    @model
      .on "lossFunc", @reportFunc 

  render: ->
    console.log @model.get("wager")
    variables = 
      wager: @model.get("wager")
      playerBudget: @model.get("playerBudget")

  
    @$el.children().detach()
    @$el.html @template(variables)
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  reportFunc: ->
    alert('Player busted. Player LOSES')



