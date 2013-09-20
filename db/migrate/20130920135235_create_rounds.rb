class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :num_correct, :default => 0
      t.integer :num_cards
      t.string  :deck_order
      t.integer :user_id
      t.integer :deck_id
      t.timestamps
    end
  end
end
