require 'test_helper'

class WordAssignerTest < ActiveSupport::TestCase
  test 'word re assignment' do
    g = games(:game1)
    w = WordAssigner.new(g)

    w.assign!
    words = g.words.pluck :label
    assert(words.sort == ['wnew1', 'wnew2'])

    assert_raises WordAssigner::NotEnoughWords do
      w.assign!
    end
  end
end
