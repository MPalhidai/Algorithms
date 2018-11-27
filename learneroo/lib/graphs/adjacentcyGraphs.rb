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
    return node.distance if start == target

    node.connections.each do |idx, dist|
      unless nodes[idx].visited || queue.include?(idx)
        queue.push(idx)
        nodes[idx].distance = node.distance + 1
      end
    end

    bfs(queue.shift(), target, queue) unless queue.empty?
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

def nodes_from_start(grid) # shortest number of stops
  nodes = []
	grid.each do |connections|
    adj = []
    connections.each_with_index{ |dist, idx| adj << [ idx, dist ] if dist != 0 }
    nodes << Node.new(adj)
  end
  matrix = Graph.new(nodes)

  matrix.nodes.each_index do |i|
    print "#{matrix.bfs(start = 0, i)} "
    matrix.nodes.each{ |node| node.visited = false }
  end
end

grid.each do |try|
	nodes_from_start(try)
  puts
end
