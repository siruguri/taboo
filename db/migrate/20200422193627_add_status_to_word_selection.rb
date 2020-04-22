class AddStatusToWordSelection < ActiveRecord::Migration[6.0]
  def change
    add_column :word_selections, :status, :integer, default: 0
  end
end
