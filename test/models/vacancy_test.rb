require 'test_helper'

class VacancyTest < ActiveSupport::TestCase
    test "should save vacancy with valid data" do
        vacancy = Vacancy.new
        vacancy.company = "Vagas"
        vacancy.title = "BackEnd Developer"
        vacancy.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        vacancy.location = "A"
        vacancy.level = 3

        assert vacancy.save
    end

    test "should not save by missing the field company" do
        vacancy = Vacancy.new
        vacancy.title = "BackEnd Developer"
        vacancy.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        vacancy.location = "A"
        vacancy.level = 3

        assert_not vacancy.save
    end

    test "should not save by missing the field title" do
        vacancy = Vacancy.new
        vacancy.company = "Vagas"
        vacancy.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        vacancy.location = "A"
        vacancy.level = 3

        assert_not vacancy.save
    end

    test "should not save because of invalid format of location field" do
        vacancy = Vacancy.new
        vacancy.company = "Vagas"
        vacancy.title = "BackEnd Developer"
        vacancy.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        vacancy.location = "AB"
        vacancy.level = 3

        assert_not vacancy.save
    end

    test "should not save because of invalid format of level field" do
        vacancy = Vacancy.new
        vacancy.company = "Vagas"
        vacancy.title = "BackEnd Developer"
        vacancy.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        vacancy.location = "A"
        vacancy.level = 7

        assert_not vacancy.save
    end

    test "should not save due to incorrect type of level field" do
        vacancy = Vacancy.new
        vacancy.company = "Vagas"
        vacancy.title = "BackEnd Developer"
        vacancy.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        vacancy.location = "A"
        vacancy.level = "A"

        assert_not vacancy.save
    end
end
