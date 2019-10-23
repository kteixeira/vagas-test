class CandidateTransformer
    def transform(candidate)
        return {
            id: candidate.id,
            nome: candidate.name,
            profissao: candidate.profession,
            localizacao: candidate.location,
            nivel: candidate.level,
        }
    end
end