require 'test_helper'

class WordAssignerTest < ActiveSupport::TestCase
  test 'word re assignment' do
    g = games(:game1)
    w = WordAssigner.new(g)

    w.assign!
    words = g.words.pluck :label
    assert(words.sort == ['wnew1', 'wnew2'])

    w.assign!
    words = g.words.pluck :label
    assert(words.sort == ['w1', 'w2', 'w3'])
  end
end
