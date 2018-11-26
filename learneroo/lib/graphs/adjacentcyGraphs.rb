class Node
  attr_accessor :visited, :connections

  def initialize(connections = [])
    @visited = false
    @connections = connections
  end
end

class Graph
  attr_accessor :nodes

  def initialize(nodes = [])
    @nodes = nodes
  end

  def dfs(start, target, distance = 0)
    node = nodes[start]
    node.visited = true
    return distance if start == target
    node.connections.each{ |conn| dfs(conn, target, distance += 1) unless node.visited }
  end

  def bfs(start, target, queue = [], distance = 0)

    node = nodes[start]
    return distance if start == target

    unless node.visited
      node.connections.each {|conn| queue.push(conn) unless nodes[conn].visited }
      node.visited = true
    end

    bfs(queue.shift(), target, queue, distance += 1) unless queue.empty?
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
    paths = []
    paths << matrix.bfs(start = 0, i)
    matrix.nodes.each{ |node| node.visited = false }
    paths.each{ |path| print "#{path} " }
  end
end

grid.each do |try|
	nodes_from_start(try)
  puts
end
