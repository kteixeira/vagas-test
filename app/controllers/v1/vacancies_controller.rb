module V1
    class VacanciesController < ApplicationController
        def create
            vacancy = Vacancy.new 
            vacancy = vacancy.save_manual_data(vacancy, vacancies_params)

            if !vacancy.errors.empty?
                return render_unprocessable_entity_response vacancy
            end

            vacancy_transformer = VacancyTransformer.new
            vacancy_transform = vacancy_transformer.transform(vacancy)
            
            render json: {status: 'SUCCESS', message: 'Artigos carregados', data: vacancy_transform},status: :created
        end

        def ranking_candidatures
            vacancy = Vacancy.find(params[:id])
            candidatures = vacancy.candidatures.order("score desc")

            ranking_transformer = RankingTransformer.new
            ranking_transform = ranking_transformer.transform(candidatures)

            render json: {data: ranking_transform}
        end

        def vacancies_params
            params.permit(:empresa, :titulo, :descricao, :localizacao, :nivel)
        end
    end
end

