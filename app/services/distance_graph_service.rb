class DistanceGraphService
	# constructor
	def initialize
		@graph = {}	 # the graph // {node => { edge1 => weight, edge2 => weight}, node2 => ...
		@nodes = Array.new		 
		@infinity = 1 << 64 	 
	end
		
	def add_edge(source, target, weight)
		if (not @graph.has_key?(source))	 
			@graph[source] = {target => weight}		 
		else
			@graph[source][target] = weight         
		end
		
		# begin code for non directed graph (inserts the other edge too)
		if (not @graph.has_key?(target))
			@graph[target] = {source => weight}
		else
			@graph[target][source] = weight
		end
        
        # end code for non directed graph (ie. deleteme if you want it directed)
		if (not @nodes.include?(source))	
			@nodes << source
        end
        
		if (not @nodes.include?(target))
			@nodes << target
		end	
	end
	
	# based of wikipedia's pseudocode: http://en.wikipedia.org/wiki/Dijkstra's_algorithm
	def dijkstra(source)
		@distances = {}
		@predecessor_node = {}
		@nodes.each do |node|
			@distances[node] = @infinity
			@predecessor_node[node] = -1
		end	
		@distances[source] = 0
		nodes_compressed = @nodes.compact
		while (nodes_compressed.size > 0)
			node_near = nil;
			nodes_compressed.each do |node_compressed|
				if (not node_near) or (@distances[node_compressed] and @distances[node_compressed] < @distances[node_near])
					node_near = node_compressed
				end
			end
			if (@distances[node_near] == @infinity)
				break
			end
			nodes_compressed = nodes_compressed - [node_near]
			@graph[node_near].keys.each do |neighbor_node|
				total_distance = @distances[node_near] + @graph[node_near][neighbor_node]
				if (total_distance < @distances[neighbor_node])
					@distances[neighbor_node] = total_distance
					@predecessor_node[neighbor_node] = node_near
				end
			end
		end
	end
	
	# to print the full shortest route to a node
	def print_path(dest)
		if @predecessor_node[dest] != -1
			print_path @predecessor_node[dest]
		end
		print ">#{dest}"
	end
	
	# get the shortests way using dijkstra
	def shortest_way(source, dest)
		@source = source
        dijkstra source
        
        if @distances[dest] != @infinity
            return @distances[dest]
        end
	end
end
