class Turn < ApplicationRecord
  belongs_to :game
  belongs_to :current_player, class_name: 'User'

  def rotate!(current_user)
    (_, index) = order.each_with_index.find { |i, idx| i == current_user.id }
    new_user_index = (index + 1) % order.size

    new_user = User.find(order[new_user_index])
    self.current_player = new_user
    save!

    new_user
  end
end
