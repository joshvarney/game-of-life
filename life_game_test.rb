require "minitest/autorun"
require_relative "life_game.rb"

class Test_Life_Game <Minitest::Test

  def test_that_a_cell_is_alive
    index_hash = {
      1 => true
    }
    assert_equal(true, alive_cell(index_hash))
  end
end