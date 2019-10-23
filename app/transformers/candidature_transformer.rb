class CandidatureTransformer
    def transform(candidature)
        return {
            id: candidature.id,
            pessoa: CandidateTransformer.new.transform(candidature.candidate),
            vaga: VacancyTransformer.new.transform(candidature.vacancy), 
            score: candidature.score
        }
    end
end