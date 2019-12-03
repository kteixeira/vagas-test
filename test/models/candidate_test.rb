require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
    test "should save candidate with valid data" do
        candidate = Candidate.new
        candidate.name = "Kaio Teixeira"
        candidate.profession = "Desenvolvedor"
        candidate.location = "C"
        candidate.level = 3
        candidate.objective = "Desenvolvedor"

        assert candidate.save
    end

    test "should not save by missing the field name" do
        candidate = Candidate.new
        candidate.profession = "Desenvolvedor"
        candidate.location = "C"
        candidate.level = 3

        assert_not candidate.save
    end

    test "should not save by missing the field profession" do
        candidate = Candidate.new
        candidate.name = "Kaio Teixeira"
        candidate.location = "C"
        candidate.level = 3

        assert_not candidate.save
    end

    test "should not save because of invalid format of location field" do
        candidate = Candidate.new
        candidate.name = "Kaio Teixeira"
        candidate.profession = "Desenvolvedor"
        candidate.location = "CC"
        candidate.level = 3

        assert_not candidate.save
    end

    test "should not save because of invalid format of level field" do
        candidate = Candidate.new
        candidate.name = "Kaio Teixeira"
        candidate.profession = "Desenvolvedor"
        candidate.location = "C"
        candidate.level = 6

        assert_not candidate.save
    end

    test "should not save due to incorrect type of level field" do
        candidate = Candidate.new
        candidate.name = "Kaio Teixeira"
        candidate.profession = "Desenvolvedor"
        candidate.location = "C"
        candidate.level = "aA"

        assert_not candidate.save
    end

    test "should not save by missing the field objective" do
        candidate = Candidate.new
        candidate.name = "Kaio Teixeira"
        candidate.profession = "Desenvolvedor"
        candidate.location = "C"
        candidate.level = 3

        assert_not candidate.save
    end
end
