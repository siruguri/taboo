class WordAssigner
  class NotEnoughWords < Exception
  end

  def initialize(game)
    @game = game
  end

  attr_reader :game

  def assign!
    WordSelection.where(game: game).update_all status: :inactive

    ws = Word.left_joins(:word_selections)
           .where(word_selections: {id: nil})

    raise NotEnoughWords.new('Not enough words left to assign to this game.') if ws.count <= 1

    ws.to_a.sample(ws.count).each do |word|
      WordSelection.create game: game, word: word, status: :active
    end

    game.start!
  end
end
