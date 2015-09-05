class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button> 
      <button class="bet-button" data-amount="10">Bet $10</button>
      <button class="bet-button" data-amount="20">Bet $20</button>
      <button class="bet-button" data-amount="30">Bet $30</button>
      <button class="bet-button" data-amount="50">Bet $50</button>
      <button class="bet-button" data-amount="100">Bet $100</button>  
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <div class="wager">Wager: <%= wager %></div>
    <div class="budget">Budget: <%= playerBudget %></div>

  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.standFunc()
    'click .bet-button' : (e) -> 
      ref = Number($(e.target).data("amount"))
      @model.makeWager(ref)

  initialize: ->
    @render()
    @listenTo @model, 'change', @render

  render: ->
    console.log @model
    variables = 
      wager: @model.get("wager")
      playerBudget: @model.get("playerBudget")

  
    @$el.children().detach()
    @$el.html @template(variables)
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  reportFunc: ->
    alert('Player busted. Player LOSES')



