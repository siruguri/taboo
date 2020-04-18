class WordAssigner
  def initialize(game)
    @game = game
  end

  attr_reader :game

  def assign!
    existing_word_ids = game.words.pluck :id

    WordSelection.where(game: game).delete_all

    ws = Word.where.not(id: existing_word_ids)
    ws.to_a.sample(ws.count).each do |word|
      game.words << word
    end

    game.start!
  end
end
