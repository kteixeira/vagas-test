require 'test_helper'

class DistanceGraphTest < ActiveSupport::TestCase
    test "should return distance 4" do
        distance_graph = DistanceGraphService.new
        distance_graph.add_edge("a", "b", 5)
        distance_graph.add_edge("b", "d", 3)
        distance_graph.add_edge("b", "c", 7)
        distance_graph.add_edge("d", "e", 10)
        distance_graph.add_edge("c", "e", 4)
        distance_graph.add_edge("d", "f", 8)
        
        assert_equal(4, distance_graph.shortest_way("e", "c"))
    end

    test "should return distance 11" do
        distance_graph = DistanceGraphService.new
        distance_graph.add_edge("a", "b", 5)
        distance_graph.add_edge("b", "d", 3)
        distance_graph.add_edge("b", "c", 7)
        distance_graph.add_edge("d", "e", 10)
        distance_graph.add_edge("c", "e", 4)
        distance_graph.add_edge("d", "f", 8)
        
        assert_equal(11, distance_graph.shortest_way("e", "b"))
    end

    test "should return distance 20" do
        distance_graph = DistanceGraphService.new
        distance_graph.add_edge("a", "b", 5)
        distance_graph.add_edge("b", "d", 3)
        distance_graph.add_edge("b", "c", 9)
        distance_graph.add_edge("d", "e", 10)
        distance_graph.add_edge("c", "e", 4)
        distance_graph.add_edge("d", "f", 8)
        
        assert_equal(20, distance_graph.shortest_way("f", "c"))
    end
end