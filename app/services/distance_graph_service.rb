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
		@distance = {}
		@prev = {}
		@nodes.each do |node|
			@distance[node] = @infinity
			@prev[node] = -1
		end	
		@distance[source] = 0
		node_compressed = @nodes.compact
		while (node_compressed.size > 0)
			u = nil;
			node_compressed.each do |min|
				if (not u) or (@distance[min] and @distance[min] < @distance[u])
					u = min
				end
			end
			if (@distance[u] == @infinity)
				break
			end
			node_compressed = node_compressed - [u]
			@graph[u].keys.each do |v|
				alt = @distance[u] + @graph[u][v]
				if (alt < @distance[v])
					@distance[v] = alt
					@prev[v]  = u
				end
			end
		end
	end
	
	# to print the full shortest route to a node
	def print_path(dest)
		if @prev[dest] != -1
			print_path @prev[dest]
		end
		print ">#{dest}"
	end
	
	# get the shortests way using dijkstra
	def shortest_way(source, dest)
		@source = source
        dijkstra source
        
        if @distance[dest] != @infinity
            return @distance[dest]
        end
	end
end
