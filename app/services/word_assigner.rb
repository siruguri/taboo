class WordAssigner
  def initialize(game)
    @game = game
  end

  attr_reader :game

  def assign!
    Word.all.to_a.sample(10).each do |word|
      game.words << word
    end
  end
end
