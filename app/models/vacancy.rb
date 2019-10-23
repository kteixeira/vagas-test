class Vacancy < ApplicationRecord
    validates :company, presence: { message: "O dado {empresa} é obrigatório!" }
	validates :title, presence: { message: "O dado {titulo} é obrigatório!" }
	validates :description, presence: { message: "O dado {descricao} é obrigatório!" }
	validates :location, presence: { message: "O dado {localizacao} é obrigatório!" }, length: { maximum: 1, message: "O dado {localizacao} tem limite máximo de 1 caractere!" }, format: { with: /\A[a-fA-F]+\z/, message: "O dado {localizacao} aceita apenas letras do A ao F!" }
	validates :level, presence: { message: "O dado {nivel} é obrigatório!" }, numericality: { only_integer: true, message: "O dado {nivel} pode ser preenchido apenas com valores numéricos!"}, format: { with: /\A[1-5]+\z/, message: "O dado {nivel} aceita números apenas do 1 ao 5" }

	has_many :candidatures, foreign_key: :id_vacancy

	def save_manual_data(vacancy, form_params)
		vacancy.company = form_params[:empresa]
		vacancy.title = form_params[:titulo]
		vacancy.description = form_params[:descricao]
		vacancy.location = form_params[:localizacao]
		vacancy.level = form_params[:nivel]

		vacancy.save

		return vacancy
	end
end
