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
    @get 'playerHand'
      .on 'standEvent', @standFunc 


    #this.get("playerHand").on("loss", this.lossFunc,)



  lossFunc: ->
    @trigger("lossFunc")

  dealerLossFunc: ->
    @trigger("dealerLossFunc")

  pushFunc: ->
    alert 'push'

  standFunc: ->
    #All the conditions
    @get 'dealerHand'
      .at(0)
        .flip()

    # if (this.get('dealerHand').minScore() >= 17){
    #     if(this.get('dealerHand').minScore() === 21) {
    #       this.trigger('lossfunc')
    #     }
    #     if(this.get('dealerHand').minScore() === this.get('playerHand').minScore()) {
    #       this.trigger('pushFunc')
    #     }
    #   }else {
    #     this.get('dealerHand').hit();
    #     if(this.get('dealerHand').minScore() === 21) {
    #       this.trigger('lossfunc')
    #     }
    #     if(this.get('dealerHand').minScore() === this.get('playerHand').minScore()) {
    #       this.trigger('pushFunc')
    #     }

    #   }
    
  # if @get 'dealerHand'
  #   .minScore() >= 17
  #   alert 'less'
  #   if @get('dealerHand').minScore() == 21
  #   @trigger 'lossfunc'
  #   if @get('dealerHand').minScore() == @get('playerHand').minScore()
  #     @trigger 'pushFunc'
  # else
  #   @get('dealerHand').hit()
  #   if @get('dealerHand').minScore() == 21
  #     @trigger 'lossfunc'
  #   if @get('dealerHand').minScore() == @get('playerHand').minScore()
  #     @trigger 'pushFunc'



    # #Check if dealer score >= 17
    # if (this.get('dealerHand').minScore() >= 17){
    #     if(this.get('dealerHand').minScore() === 21) {
    #       this.trigger('lossfunc')
    #     }
    #     if(this.get('dealerHand').minScore() === this.get('playerHand').minScore()) {
    #       this.trigger('pushFunc')
    #     }
    #   }else {
    #     this.get('dealerHand').hit();
    #     if(this.get('dealerHand').minScore() === 21) {
    #       this.trigger('lossfunc')
    #     }
    #     if(this.get('dealerHand').minScore() === this.get('playerHand').minScore()) {
    #       this.trigger('pushFunc')
    #     }

    #   }


   
      #Check if dealer hit 21
        #If he hit 21, broadcast dealer wins

      #Check if dealer score === player score
        #If they're equal, broadcast push/tie!

    #ELSE dealer score < 17
      #Keep hitting and do checks
      # if dealer score > 21 
        # you WIN Dealer busts
      # do checks 





