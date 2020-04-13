class AddPlayCountToWordSelection < ActiveRecord::Migration[6.0]
  def change
    add_column :word_selections, :play_count, :integer, default: 0
  end
end
