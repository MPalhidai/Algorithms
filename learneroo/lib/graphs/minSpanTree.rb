def minimumTree(adjacency = grid[0])
  vertices = adjacency.length
  traversed_vertices = [0]
  edges = []

  # using Prim's algorithm
  while traversed_vertices.count < vertices do
    possible_verts = adjacency.map.with_index do |col, y|
  	{column: col, index: y } # get indices of columns
    end.select do |col|
  	traversed_vertices.include? col[:index] # exclude columns not traversed yet
    end.map do |col|
  	col[:column].map.with_index do |edge_weight, x|
  	  {row: x, col: col[:index], weight: edge_weight} # collate edge data
  	end.select do |vert|
  	  not traversed_vertices.include? vert[:row] # exclude rows already traversed
  	end
    end.flatten
    possible_verts.select! {|vert| vert[:weight] > 0} # get rid of -1s (ie. no edge)
    possible_verts.sort_by! {|vert| vert[:weight]} # sort
    best_match = possible_verts[0] # get shortest
    edges.push best_match
    traversed_vertices.push best_match[:row]
  end

  weights = edges.map {|edge| edge[:weight]}.each{|weight| print "#{weight} "}
  puts
  path = edges.map {|edge| print "(#{edge[:col]}->#{edge[:row]})" }
end

grid = []

grid << [[0, 4, 1, 4, 0, 0, 0, 0, 0, 0],
[4, 0, 5, 0, 9, 9, 0, 7, 0, 0],
[1, 5, 0, 3, 0, 0, 0, 9, 0, 0],
[4, 0, 3, 0, 0, 0, 0, 10, 0, 18],
[0, 9, 0, 0, 0, 2, 4, 0, 6, 0],
[0, 9, 0, 0, 2, 0, 2, 8, 0, 0],
[0, 0, 0, 0, 4, 2, 0, 9, 3, 9],
[0, 7, 9, 10, 0, 8, 9, 0, 0, 8],
[0, 0, 0, 0, 6, 0, 3, 0, 0, 9],
[0, 0, 0, 18, 0, 0, 9, 8, 9, 0]]

grid << [[0, 0, 1, 3, 0, 0],
[0, 0, 0, 5, 0, 0],
[1, 0, 0, 2, 1, 4],
[3, 5, 2, 0, 7, 0],
[0, 0, 1, 7, 0, 2],
[0, 0, 4, 0, 2, 0]]

grid << [[0, 3, 5],
[3, 0, 1],
[5, 1, 0]]

grid.each do |try|
  minimumTree(try)
  puts
end
