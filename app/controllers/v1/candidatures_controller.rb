module V1
    class CandidaturesController < ApplicationController
        def create
            vacancy = Vacancy.find(candidatures_params[:id_vaga]) rescue nil
            candidate = Candidate.find(candidatures_params[:id_pessoa]) rescue nil

            if !vacancy
                return render_unprocessable_entity_response ({errors: "A vaga do id '#{candidatures_params[:id_vaga]}' não foi encontrada"})
            end

            if !candidate
                return render_unprocessable_entity_response ({message: "A pessoa do id '#{candidatures_params[:id_pessoa]}' não foi encontrada"})
            end
            
            score_service = ScoreService.new
            score_without_percent = score_service.calculating_score(vacancy.location, candidate.location, vacancy.level, candidate.level)
            score_with_percent = score_service.add_objective_percent(score_without_percent, candidate.objective, vacancy.description)

            candidature = Candidature.create(
                id_vacancy: candidatures_params[:id_vaga],
                id_candidate: candidatures_params[:id_pessoa],
                score: score_with_percent,
            )

            if !candidature.errors.empty?
                return render_unprocessable_entity_response candidature.errors
            end
           
            candidature_transformer = CandidatureTransformer.new
            candidature_transform = candidature_transformer.transform(candidature)

            return render json: {status: 'success', message: 'Candidatura criada!', data: candidature_transform},status: :created
        end

        def candidatures_params
            @form_params = params.permit(:id_vaga, :id_pessoa)
        end
    end
end
