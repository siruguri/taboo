class Word < ApplicationRecord
  has_many :games, inverse_of: :word
  has_many :word_selections

  def self.lowest_count_words(game)
    min = joins(:word_selections)
            .where(word_selections: {game: game})
            .pluck('word_selections.play_count').min

    joins(:word_selections)
      .where(word_selections: {game: game})
      .where('word_selections.play_count = ?', min)
  end
end
