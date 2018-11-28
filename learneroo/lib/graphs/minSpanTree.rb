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

  def minimumTree(start)

    # from 0 to nodes.length check all connections and pick the shortest mark both are known then go to next node not known and connect it to the nearest connected node
    idx = start
    output = [] # output
    possible_connections = []
    until nodes.all?{ |node| node.visited } # queue
      nodes[idx].visited = true

      # tuple = nodes[idx].connections.sort_by{ |index, dist| dist }.first

      tuple = []
      minimum_branch = Float::INFINITY
      nodes[idx].connections.each do |index, distance|
        if !nodes[index].visited && distance < minimum_branch
          minimum_branch = distance
          tuple = [index, distance]
        end
      end

      if tuple != []
        idx = tuple.first
      elsif nodes.any?{ |node| !node.visited }
        idx = nodes.index{ |node| !node.visited }
        tuple = nodes[idx].connections.sort_by{ |i, d| d }.first
        idx = tuple.first
        tuple = nodes[tuple.first].connections.sort_by{ |i, d| d }.first
      end
      output << tuple.last unless !idx
    end
    return output
  end
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
