require 'test_helper'

class VacanciesControllerTest < ActionDispatch::IntegrationTest
    test "can create an candidature" do
        post "/v1/candidaturas",
        params: { id_vaga: vacancies(:one).id, id_pessoa: candidates(:four).id }
        
        json_response = JSON.parse(response.body)
        
        assert_response :created
        assert_equal vacancies(:one).id, json_response['data']['vaga']['id']
    end

    test "can create an candidature duplicate" do
        post "/v1/candidaturas",
        params: { id_vaga: vacancies(:one).id, id_pessoa: candidates(:one).id }
        
        assert_response :unprocessable_entity
    end

    test "can create an candidature with validate score" do
        post "/v1/candidaturas",
        params: { id_vaga: vacancies(:one).id, id_pessoa: candidates(:four).id }
        
        json_response = JSON.parse(response.body)

        assert_response :created
        assert_equal vacancies(:one).id, json_response["data"]["vaga"]["id"]
        assert_equal candidates(:four).id, json_response["data"]["pessoa"]["id"]
        assert_equal 87, json_response["data"]["score"]
    end

    test "can create an candidature with invalid vacancy id" do
        post "/v1/candidaturas",
        params: { id_vaga: 155, id_pessoa: candidates(:four).id }
        
        assert_response :unprocessable_entity
    end

    test "can create an candidature with invalid candidate id" do
        post "/v1/candidaturas",
        params: { id_vaga: vacancies(:one).id, id_pessoa: 155 }
        
        assert_response :unprocessable_entity
    end
end