assert = chai.assert

describe 'hand 1243', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck([
      {
        rank: 11
        suit: 0
      }
      {
        rank: 11
        suit: 0
      }
      {
        rank: 11
        suit: 0
      }
      {
        rank: 11
        suit: 0
      }


    ])

  describe 'hit', ->
    it 'Player score is above 21', ->
      player = deck.dealPlayer(); #This is a player with a rigged deck
      
      player.hit();
      ref = player.minScore()
      expect(player.minScore()).to.be.above(21);

    it 'Dealer score is above 21', ->
      dealer = deck.dealDealer()
      dealer.hit()
      dealer.hit()
      dealer.hit()
      expect(dealer.minScore()).to.be.above(21);




      #expect(1).to.equal(1);



      #spy = sinon.spy(window, 'alert');
      # sinon.assert(spy.called);




# We need to make a player hand with isDealer false
# Give him a rigged deck of 3 cards with 10
# the player hits
# Some test to determine if "Lose" values