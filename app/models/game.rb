class Game < ApplicationRecord
  has_many :word_selections
  has_many :words, through: :word_selections

  has_many :game_players
  has_many :players, class_name: 'User', through: :game_players, source: :user

  has_one :turn

  def start!
    turn&.delete
    u = players.sample

    order = players.select { |p| p.id != u.id }.map { |u| u.id }
    unless u.nil?
      Turn.create game: self, current_player: u, order: order
    end
  end

  def current_player
    turn.current_player
  end
end
