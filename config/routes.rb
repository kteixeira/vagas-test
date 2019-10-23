Rails.application.routes.draw do
    namespace 'v1' do
        post "/vagas", to: "vacancies#create"
        post "/pessoas", to: "candidates#create"
        post "/candidaturas", to: "candidatures#create"

        resources :vacancies, path: '/vagas' do
            member do
                get '/candidaturas/ranking', to: 'vacancies#ranking_candidatures'
            end
        end
    end
end
