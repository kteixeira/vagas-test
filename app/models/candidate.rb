class Candidate < ApplicationRecord
    validates :name, presence: { message: "O dado {nome} é obrigatório!" }
	validates :profession, presence: { message: "O dado {profissao} é obrigatório!" }
	validates :location, presence: { message: "O dado {localizacao} é obrigatório!" }, length: { maximum: 1, message: "O dado {localizacao} tem limite máximo de 1 caractere!" }, format: { with: /\A[a-fA-F]+\z/, message: "O dado {localizacao} aceita letras apenas do A ao F!" }
	validates :level, presence: { message: "O dado {nivel} é obrigatório!" }, numericality: { only_integer: true, message: "O dado {nivel} pode ser preenchido apenas com valores numéricos!" }, format: { with: /\A[1-5]+\z/, message: "O dado {nivel} aceita números apenas do 1 ao 5" }
    
	has_many :candidatures, foreign_key: :id_candidate

	def save_manual_data(candidate, form_params)
		candidate.name = form_params[:nome]
		candidate.profession = form_params[:profissao]
		candidate.location = form_params[:localizacao]
		candidate.level = form_params[:nivel]

		candidate.save

		return candidate
	end
end
