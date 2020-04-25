require 'rails_helper'

RSpec.describe 'Game' do
  describe 'validations' do
    it 'validates name' do
      g = Game.new name: nil
      assert(!g.valid?)
    end
  end

  describe 'instance methods' do
    it "#increment_current_word!" do
      g = games(:game2)

      assert(g.current_word == words(:w2))
      g.increment_current_word!
      assert(g.current_word == words(:w1))

      ws = g.word_selections.where(word: words(:w2))
      assert(ws.first.inactive?)
    end

    it '#start!' do
      g = games(:game1)
      g.start!

      assert(g.current_word.present?)
    end
  end
end
