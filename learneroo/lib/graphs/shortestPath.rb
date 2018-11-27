class Node
  attr_accessor :visited, :connections, :distance

  def initialize(connections = [])
    @visited = false
    @connections = connections
    @distance = 0
  end
end

class Graph
  attr_accessor :nodes

  def initialize(nodes = [])
    @nodes = nodes
  end

  def bfs(start, target, queue = [])
    node = nodes[start]
    node.visited = true

    return nodes[target].distance if target == 0

    node.connections.each do |idx, dist|
      if nodes[idx].distance == 0 || nodes[idx].distance > node.distance + dist
        nodes[idx].distance = node.distance + dist
      end
      queue.push(idx) unless nodes[idx].visited || queue.include?(idx)
    end

    bfs(queue.shift(), target, queue) unless queue.empty?

    return nodes[target].distance
  end
end

grid = []

grid << [[0, 0, 1, 3, 0, 0],
[0, 0, 0, 5, 0, 0],
[1, 0, 0, 2, 1, 4],
[3, 5, 2, 0, 7, 0],
[0, 0, 1, 7, 0, 2],
[0, 0, 4, 0, 2, 0]]

grid << [[0, 3, 5],
[3, 0, 1],
[5, 1, 0]]

def nodes_from_start(grid)
  nodes = []
	grid.each do |connections|
    adj = []
    connections.each_with_index{ |dist, idx| adj << [ idx, dist ] if dist != 0 }
    nodes << Node.new(adj)
  end
  matrix = Graph.new(nodes)

  matrix.nodes.each_index do |i|
    print "#{matrix.bfs(from = 0, to = i)} "
    matrix.nodes.each{ |node| node.visited = false }
  end
end

grid.each do |try|
	nodes_from_start(try)
  puts
end
