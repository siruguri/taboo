class Turn < ApplicationRecord
  belongs_to :game
  belongs_to :current_player, class_name: 'User'
end
