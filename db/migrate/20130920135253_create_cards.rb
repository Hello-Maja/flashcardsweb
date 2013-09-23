class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string  :question
      t.string  :answer
      t.integer :deck_id
      t.string  :image
      t.timestamps
    end
  end
end
