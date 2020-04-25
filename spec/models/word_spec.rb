require 'test_helper'

class WordTest < ActiveSupport::TestCase
  test "lowest_count_words" do
    assert Word.lowest_count_words(games(:game1)) == [words(:w1)]
  end
end
