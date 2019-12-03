require 'test_helper'

class CandidatesControllerTest < ActionDispatch::IntegrationTest
    test "can create an candidate" do
        post "/v1/pessoas",
        params: { nome: "Kaio Leal", profissao: "Desenvolvedor BackEnd Pl Sr", localizacao: "a", nivel: 4, objetivo: "Desenvolvedor" }
        
        json_response = JSON.parse(response.body)
        
        assert_response :created
        assert_equal "Kaio Leal", json_response["data"]["nome"]
    end

    test "can create an candidate with invalid params" do
        post "/v1/pessoas",
        params: { nome: "Kaio Leal", profissao: "Desenvolvedor BackEnd Pl Sr", nivel: 4 }
        
        assert_response :unprocessable_entity
    end
end
