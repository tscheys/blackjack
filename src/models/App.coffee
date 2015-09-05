# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    _.bindAll @

    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'playerBudget', 1000
    @set 'wager', 0

    @get 'playerHand' 
      .on 'checkPlayerBust', @checkPlayerBust
    

  checkPlayerBust: ->
    scoreCheck = @get("playerHand").minScore()

    if scoreCheck == 21 
      alert('Blackjack!! Player wins!')

    if scoreCheck > 21 
      alert('Busted over 21. You lose.')

  makeWager: (amount) ->
   newAmount = @get 'wager' + amount
   @set 'wager', newAmount
   @deductFromBudget(amount)

  addToBudget: (amount) ->
    newAmount = @get 'playerBudget' + amount
    @set 'playerBudget', newAmount

  deductFromBudget: (amount) ->
    newAmount = @get 'playerBudget' - amount
    @set 'playerBudget', newAmount

  endGame: (input) ->
    alert input


  standFunc: ->
    @get 'dealerHand'
      .at(0)
        .flip()

    dealerScore = @get 'dealerHand'
      .minScore()

    while (true)
      dealerScore = @get 'dealerHand'
        .minScore()

      playerScore = @get 'playerHand'
        .minScore()
      
      if dealerScore >= 17
        if dealerScore == 21
          @endGame 'Dealer got blackjack'
          break
        if dealerScore == playerScore
          @endGame 'Push its a tie!'
          break
        if dealerScore >= 21
          @endGame 'Player WINS! Dealer busts.'
          break
        if dealerScore > playerScore
          @endGame 'Player LOSES. Dealer wins'
          break
        if dealerScore < playerScore
          @endGame "Player WINS!"
          break

      @get 'dealerHand' 
        .hit()






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




