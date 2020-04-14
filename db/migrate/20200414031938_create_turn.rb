class CreateTurn < ActiveRecord::Migration[6.0]
  def change
    create_table :turns do |t|
      t.integer :game_id
      t.integer :current_player_id
      t.jsonb :order

      t.timestamps
    end
  end
end
