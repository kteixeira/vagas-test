require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
    test "should return validate distance 50" do
        score = ScoreService.new
        assert_equal(50, score.validate_distance(11))
    end

    test "should return distance 50" do
        score = ScoreService.new
        assert_equal(50, score.distance("e", "b"))
    end

    test "should return level 50" do
        score = ScoreService.new
        assert_equal(50, score.calculating_level(5, 3))
    end

    test "should return score 87" do
        score = ScoreService.new
        assert_equal(87, score.calculating_score("e", "a", 3, 5))
    end
end