class VacancyTransformer
    def transform(vacancy)
        return {
            id: vacancy.id,
            empresa: vacancy.company,
            titulo: vacancy.title,
            descricao: vacancy.description,
            localizacao: vacancy.location,
            nivel: vacancy.level,
        }
    end
end