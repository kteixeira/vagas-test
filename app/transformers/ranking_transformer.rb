class RankingTransformer
    def transform(candidatures)
        data_transformed = []

        for candidature in candidatures
            data_transformed.push({
                nome: candidature.candidate.name,
                profissao: candidature.candidate.name,
                localizacao: candidature.candidate.name,
                nivel: candidature.candidate.name,
                score: candidature.score,
            })
        end
        
        return data_transformed
    end
end