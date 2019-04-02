class Robot
  attr_reader :coordinates

  @@compass = {
    north: [0, 1],
    east: [1, 0],
    south: [0, -1],
    west: [-1, 0]
  }

  def initialize
    @directions = @@compass.keys
    @coordinates = [0, 0]
  end

  def orient(direction)
    raise ArgumentError unless @@compass[direction]
    until bearing == direction
      @directions.rotate!(1)
    end
    bearing
  end

  def turn_right
    @directions.rotate!(1)
    bearing
  end

  def turn_left
    @directions.rotate!(-1)
    bearing
  end

  def bearing
    @directions[0]
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def advance
    @coordinates[0] += @@compass[bearing][0]
    @coordinates[1] += @@compass[bearing][1]
  end
end

class Simulator
  @@robot_actions = {
    'L' => :turn_left,
    'R' => :turn_right,
    'A' => :advance
  }

  def instructions(actions)
    actions.chars.map!{ |action| @@robot_actions[action] }
  end

  def place(robot, args)
    robot.at(args[:x], args[:y])
    robot.orient(args[:direction])
  end

  def evaluate(robot, actions)
    instructions(actions).each{ |action| robot.send(action) }
  end
end
