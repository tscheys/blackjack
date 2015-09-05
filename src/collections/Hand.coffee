class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    # give random card to player 
    @add(@deck.pop())
    @last()
    # rerender check
    # recalculate 
    @scores()
    if !@isDealer
      if @minScore() > 21
        console.log("Player busted. LOSE")
    else 
      if @minScore() > 21
        console.log("dealer busted. WIN")



  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]


#var ourDeck = new Deck ([{{1:1}, {jack: 10}, {queen: 10}}]);

#var dealer = new Hand ([card, card, card], ourDeck, true]);
#var player = new Hand ([card, card, card], ourDeck, false]);


