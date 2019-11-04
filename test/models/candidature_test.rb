require 'test_helper'

class CandidatureTest < ActiveSupport::TestCase
    test "should save candidature with valid data" do
        candidature = Candidature.new
        candidature.id_candidate = candidates(:four).id
        candidature.id_vacancy = vacancies(:one).id
        candidature.score = 138

        assert candidature.save
    end

    test "should not save by missing the field id_candidate" do
        candidature = Candidature.new
        candidature.id_vacancy = vacancies(:one).id
        candidature.score = 138

        assert_not candidature.save
    end

    test "should not save by missing the field score" do
        candidature = Candidature.new
        candidature.id_candidate = candidates(:four).id
        candidature.id_vacancy = vacancies(:one).id

        assert_not candidature.save
    end

    test "should not save because there is no candidate with the submitted id" do
        candidature = Candidature.new
        candidature.id_candidate = 123
        candidature.id_vacancy = vacancies(:one).id
        candidature.score = 138

        assert_not candidature.save
    end

    test "should not save because there is no vacancy with the submitted id" do
        candidature = Candidature.new
        candidature.id_candidate = candidates(:four).id
        candidature.id_vacancy = 123
        candidature.score = 138

        assert_not candidature.save
    end
end
