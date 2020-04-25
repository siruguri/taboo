class Game < ApplicationRecord
  has_many :word_selections
  has_many :all_words, through: :word_selections, class_name: 'Word'

  has_many :game_players
  has_many :players, class_name: 'User', through: :game_players, source: :user

  has_one :turn
  belongs_to :current_word, class_name: 'Word', optional: true

  validates_presence_of :name

  def words
    Word.joins(:word_selections).where(word_selections: {game_id: self.id, status: :active})
  end

  def start!
    turn&.delete
    u = players.sample

    order = players.map { |u| u.id }.sample(players.size)
    unless u.nil?
      Turn.create game: self, current_player: u, order: order

      self.current_word = Word.lowest_count_words(self).sample
      save!
    end
  end

  def current_player
    turn&.current_player
  end

  def increment_current_word!
    w = word_selections.where(word_id: current_word.id).first
    w.update play_count: w.play_count + 1, status: :inactive
    
    v = nil
    until v.present? && v != current_word
      v = Word.lowest_count_words(self).sample
    end

    self.current_word = v
    save!
  end
end
