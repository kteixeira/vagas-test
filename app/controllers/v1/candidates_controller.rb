module V1
    class CandidatesController < ApplicationController
        def create
            candidate = Candidate.create
            candidate.save_manual_data(candidate, candidates_params)

            if !candidate.errors.empty?
                return render_unprocessable_entity_response candidate
            end

            candidate_transformer = CandidateTransformer.new
            candidate_transform = candidate_transformer.transform(candidate)
            
            render json: {status: 'sucess', message: 'Artigos carregados', data: candidate_transform}, status: :created
        end
    
        def candidates_params
            @form_params = params.permit(:nome, :profissao, :localizacao, :nivel)
        end
    end
end