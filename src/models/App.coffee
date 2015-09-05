# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    _.bindAll @

    @set 'deck', deck = new Deck()
    # this.set('currentSong', new SongModel());

    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    #@get 'playerHand'.on @lossFunc
    @get 'playerHand'
      .on 'loss', @lossFunc  
    @get 'dealerHand'
      .on 'dealerLoss', @dealerLossFunc  


    #this.get("playerHand").on("loss", this.lossFunc,)



  lossFunc: ->
    @trigger("lossFunc")

  dealerLossFunc: ->
    @trigger("dealerLossFunc")


