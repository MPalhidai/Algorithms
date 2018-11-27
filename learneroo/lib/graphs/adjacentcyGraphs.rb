class Node
  attr_accessor :visited, :connections, :distance

  def initialize(connections = [])
    @visited = false
    @connections = connections
    @distance = 0
  end
end

class Graph
  attr_accessor :nodes, :paths

  def initialize(nodes = [], paths = [])
    @nodes = nodes
    @paths = paths
  end

  def bfs(start, target, queue = [])

    node = nodes[start]
    node.visited = true
    @paths << node.distance if start == target

    node.connections.each do |conn|
      unless nodes[conn].visited || queue.include?(conn)
        queue.push(conn)
        nodes[conn].distance = node.distance + 1
      end
    end

    bfs(queue.shift(), target, queue) unless queue.empty?
    @paths
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
    connections.each_with_index{ |dist, idx| adj << idx if dist != 0 }
    nodes << Node.new(adj)
  end
  matrix = Graph.new(nodes)

  matrix.nodes.each_index do |i|
    matrix.bfs(start = 0, i)
    matrix.nodes.each{ |node| node.visited = false }
    print "#{matrix.paths.min} "
    matrix.paths = []
  end
end

grid.each do |try|
	nodes_from_start(try)
  puts
end
