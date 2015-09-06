class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button waves-effect waves-light btn">Hit</button> 

    <button class="stand-button waves-effect waves-light btn">Stand</button> 
      <button class="bet-button btn-floating btn-large waves-effect waves-light red" data-amount="10">$10</button>
      <button class="bet-button btn-floating btn-large waves-effect waves-light blue"  data-amount="20">$20</button>
      <button class="bet-button btn-floating btn-large waves-effect waves-light green"  data-amount="30">$30</button>
      <button class="bet-button btn-floating btn-large waves-effect waves-light black"  data-amount="50">$50</button>
      <button class="bet-button btn-floating btn-large waves-effect waves-light yellow"  data-amount="100">$100</button>  
   
    <div class="row">
      <div class="col s6"><div class="player-hand-container"></div></div>
      <div class="col s6"> <div class="dealer-hand-container"></div></div>
    </div>


    <ul class="collection">
      <li class="collection-item"><div class="wager">Wager: $<%= wager %></div></li>
      <li class="collection-item"><div class="budget">Budget: $<%= playerBudget %></div></li>
      </ul>

    <img class="loanSharks" src="https://media.giphy.com/media/Sn5wtBXdTovOo/giphy.gif">




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
    @listenTo @model, 'loanSharkVisit', @loanSharkVisit

  loanSharkVisit: ->
    $(".loanSharks").toggle()

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



