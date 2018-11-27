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

  def minimumTree(start, target = 0, queue = [], output = [])

    # from 0 to nodes.length check all connections and pick the shortest mark both are known then go to next node not known and connect it to the nearest connected node

    node = nodes[start]
    node.visited = true

    node.connections.sort_by{ |idx, dist| dist }.each do |idx, dist|
      unless nodes[idx].visited || queue.include?(idx)
        queue << idx
        output << dist
      end
    end

    minimumTree(queue.shift(), target, queue, output) unless queue.empty?

    return output
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

def createGraph(grid)
  nodes = []
	grid.each do |connections|
    adj = []
    connections.each_with_index{ |dist, idx| adj << [ idx, dist ] if dist != 0 }
    nodes << Node.new(adj)
  end
  matrix = Graph.new(nodes)

  matrix.minimumTree(from = 0).each{ |element| print "#{element} " }
end

grid.each do |try|
	createGraph(try)
  puts
end
