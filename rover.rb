class Rover
  attr_reader :x_coord, :y_coord, :direction
  def initialize(x_coord , y_coord , direction)
    @x_coord = x_coord
    @y_coord = y_coord
    @direction = direction
  end

  def read_instruction(instruction)
    instruction.each_char  do |char|
      if char.downcase=="m"
        move
      else
        turn
      end
    end
  end

  def move
    puts "move"
  end

  def turn
    puts "turn"
  end
end

my_rover = Rover.new(0,0,"N")
my_rover.read_instruction("MMRMMRMRRM")
