class AddCurrentWordToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :current_word_id, :integer
  end
end
