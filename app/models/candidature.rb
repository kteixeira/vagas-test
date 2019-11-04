class Candidature < ApplicationRecord
    belongs_to :vacancy, foreign_key: :id_vacancy
    belongs_to :candidate, foreign_key: :id_candidate
    validates  :score, numericality: { only_integer: true }
    
    validates_uniqueness_of :id_candidate, scope: [:id_vacancy], :message => 'Ops! Você já se submeteu à esta vaga.'
end
