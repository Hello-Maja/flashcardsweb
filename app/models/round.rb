class Round < ActiveRecord::Base
  has_many   :guesses
  belongs_to :user
  belongs_to :deck

  before_create :set_deck_order
  before_create :set_num_cards

  def get_card_ids
    array = []
    self.deck.cards.each do |card|
      array << card.id
    end
    array
  end

  def set_num_cards
    self.num_cards = get_card_ids.length
  end

  def set_deck_order
    shuf = get_card_ids.shuffle
    self.deck_order = shuf.join(',')
  end

  def deck_array
    self.deck_order.split(',')
  end

  def finish
    self.guesses.each do |guess|
      if guess.correct == true
        self.num_correct += 1
      end  
    end
    self.save!
  end
end
