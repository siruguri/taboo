class CreateTitle < ActiveRecord::Migration[6.0]
  def change
    create_table :titles do |t|
      t.integer :titleable_id
      t.string :titleable_type
    end
  end
end
