class CreateGameV2s < ActiveRecord::Migration[6.0]
  def change
    create_table :game_v2s do |t|
      t.string :name

      t.timestamps
    end
  end
end
