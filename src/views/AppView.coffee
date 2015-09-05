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
    'click .stand-button': -> @model.get('playerHand').stand()
    'click .bet-button' : ->  @model.makeWager()

  initialize: ->
    @render()
    @model
      .on "lossFunc", @reportFunc
    @model
      .on "updateBudgetWager", @render
    

  render: ->

    theWager = @model
      .get("wager")

    theBudget = @model
      .get("playerBudget")

    variables = 
      wager: theWager
      playerBudget: theBudget

    
    helper = @template
    @$el.children().detach()
    @$el.html @template(variables)
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  reportFunc: ->
    alert('Player busted. Player LOSES')



