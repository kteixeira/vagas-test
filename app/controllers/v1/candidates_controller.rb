module V1
    class CandidatesController < ApplicationController
        def create
            candidate = Candidate.create(
                name: candidates_params[:nome],
                profession: candidates_params[:profissao],
                location: candidates_params[:localizacao],
                level: candidates_params[:nivel],
            )

            if !candidate.errors.empty?
                return render_unprocessable_entity_response candidate.errors
            end

            candidate_transformer = CandidateTransformer.new
            candidate_transform = candidate_transformer.transform(candidate)
            
            render json: {status: 'success', message: 'Pessoa criada!', data: candidate_transform}, status: :created
        end
    
        def candidates_params
            @form_params = params.permit(:nome, :profissao, :localizacao, :nivel)
        end
    end
end