class ScoreService
    # shortest way calculated by graph
    def distance(source, target)
        distance_graph = DistanceGraphService.new
        distance_graph.add_edge("a", "b", 5)
        distance_graph.add_edge("b", "d", 3)
        distance_graph.add_edge("b", "c", 7)
        distance_graph.add_edge("d", "e", 10)
        distance_graph.add_edge("d", "f", 8)
        distance_graph.add_edge("c", "e", 4)
        
        shortest_way = distance_graph.shortest_way(source.downcase, target.downcase)

        return validate_distance(shortest_way)
    end

    # validate distance according to the shortest way
    def validate_distance(shortest_way)
        if shortest_way >= 0 and shortest_way <= 5
            return 100
        end
        
        if shortest_way > 5 and shortest_way <= 10
            return 75
        end

        if shortest_way > 10 and shortest_way <= 15
            return 50
        end

        if shortest_way > 15 and shortest_way <= 20
            return 25
        end

        if shortest_way > 20
            return 0
        end
    end

    # calculating the level according to the business rule
    def calculating_level(vacancy_experience, candidate_experience)
        return 100 - 25 * (vacancy_experience - candidate_experience)
    end

    # calculating the score according to the business rule 
    def calculating_score(source, target, vacancy_experience, candidate_experience)
        distance = distance(source, target)

        level = calculating_level(vacancy_experience, candidate_experience)

        return (level + distance) / 2
    end
end
