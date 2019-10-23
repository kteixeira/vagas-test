require 'test_helper'

class VacanciesControllerTest < ActionDispatch::IntegrationTest
    test "can create an vacancy" do
        post "/v1/vagas",
        params: { empresa: "VAGAS.com", titulo: "Engenheiro de Software Pl/Sr", descricao: "Vaga teste", localizacao: "D", nivel: 4 }
        
        json_response = JSON.parse(response.body)
        
        assert_response :created
        assert_equal "VAGAS.com", json_response["data"]["empresa"]
    end

    test "can create an vacancy with invalid params" do
        post "/v1/vagas",
        params: { empresa: "VAGAS.com", titulo: "Engenheiro de Software Pl/Sr", nivel: 4 }
        
        json_response = JSON.parse(response.body)
        
        assert_response :unprocessable_entity
    end

    test "can get ranking with ordering" do
        get "/v1/vagas/#{vacancies(:one).id}/candidaturas/ranking"
        json_response = JSON.parse(response.body)

        assert_response :success
        assert_equal 138, json_response["data"][0]["score"]
        assert_equal 125, json_response["data"][1]["score"]
        assert_equal 113, json_response["data"][2]["score"]
    end
end
