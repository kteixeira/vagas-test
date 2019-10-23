module V1
    class CandidaturesController < ApplicationController
        def create
            candidatures_params
            
            candidature = Candidature.new
            candidature = candidature.save_manual_data(candidature, candidatures_params)

            if !candidature.errors.empty?
                return render_unprocessable_entity_response candidature
            end
           
            candidature_transformer = CandidatureTransformer.new
            candidature_transform = candidature_transformer.transform(candidature)

            render json: {status: 'success', message: 'Candidatura criada!', data: candidature_transform},status: :created
        end

        def candidatures_params
            @form_params = params.permit(:id_vaga, :id_pessoa)
        end
    end
end

