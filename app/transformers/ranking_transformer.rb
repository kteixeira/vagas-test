class RankingTransformer
    def transform(candidatures)
        data_transformed = []

        for candidature in candidatures
            data_transformed.push({
                nome: candidature.candidate.name,
                profissao: candidature.candidate.profession,
                localizacao: candidature.candidate.location,
                nivel: candidature.candidate.level,
                score: candidature.score,
            })
        end
        
        return data_transformed
    end
end