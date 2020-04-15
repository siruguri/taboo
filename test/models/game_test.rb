require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "#increment_current_word!" do
    g = games(:game1)

    g.current_word = words(:w1)
    g.save!

    g.increment_current_word!

    assert(g.current_word != words(:w1))
    
  end

  test '#start!' do
    g = games(:game1)
    g.start!

    assert(g.current_word.present?)
  end
end
