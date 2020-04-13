class CreateWordSelection < ActiveRecord::Migration[6.0]
  def change
    create_table :word_selections do |t|
      t.integer :word_id
      t.integer :game_id
    end
  end
end
