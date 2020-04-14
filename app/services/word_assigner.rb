class WordAssigner
  def initialize(game)
    @game = game
  end

  attr_reader :game

  def assign!
    WordSelection.where(game: game).delete_all

    Word.all.to_a.sample(10).each do |word|
      game.words << word
    end

    game.start!
  end
end
