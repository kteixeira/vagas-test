class Candidature < ApplicationRecord
    belongs_to :vacancy, foreign_key: :id_vacancy
    belongs_to :candidate, foreign_key: :id_candidate
    validates  :score, numericality: { only_integer: true }
    
    validates_uniqueness_of :id_candidate, scope: [:id_vacancy], :message => 'Ops! Você já se submeteu à esta vaga.'

    def save_manual_data(candidature, form_params)
        candidature.id_vacancy = form_params[:id_vaga]
        candidature.id_candidate = form_params[:id_pessoa]

        score_service = ScoreService.new
        score = score_service.calculating_score(candidature.vacancy.location, candidature.candidate.location, candidature.vacancy.level, candidature.candidate.level)

        candidature.score = score
        candidature.save

        return candidature
    end
end
