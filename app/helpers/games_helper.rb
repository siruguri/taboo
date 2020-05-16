module GamesHelper
  def active_words_count(game)
    @_awc ||= {}
    @_awc[game.id] ||= game.word_selections.where(status: :active).count
  end
end
