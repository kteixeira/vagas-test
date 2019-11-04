module V1
    class VacanciesController < ApplicationController
        def create
            vacancy = Vacancy.create(
                company: vacancies_params[:empresa],
                title: vacancies_params[:titulo],
                description: vacancies_params[:descricao],
                location: vacancies_params[:localizacao],
                level: vacancies_params[:nivel],
            )

            if !vacancy.errors.empty?
                return render_unprocessable_entity_response vacancy.errors
            end

            vacancy_transformer = VacancyTransformer.new
            vacancy_transform = vacancy_transformer.transform(vacancy)
            
            render json: {status: 'success', message: 'Vaga criada!', data: vacancy_transform},status: :created
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

