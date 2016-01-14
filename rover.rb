class Rover
  attr_reader :x_coord, :y_coord, :direction
  def initialize(x_coord , y_coord , direction)
    @x_coord = x_coord.to_i
    @y_coord = y_coord.to_i
    @direction = direction
    puts "New rover #{@x_coord} #{@y_coord} #{@direction}"
  end

  def read_instruction(instruction)
    instruction.each_char  do |char|
      if char.upcase=="M"
        move
      else
        turn(char.upcase)
      end
    end

    puts "#{x_coord} #{y_coord} #{direction}"
  end

  def move
    if @direction == "N"
      @y_coord += 1
    elsif @direction == "E"
      @x_coord += 1
    elsif @direction == "S"
      @y_coord -= 1
    else
      @x_coord -= 1
    end
  end

  def turn(direction_turn)
    if direction_turn == "R"
      if @direction == "N"
        @direction = "E"
      elsif @direction == "E"
        @direction = "S"
      elsif @direction == "S"
        @direction = "W"
      else
        @direction = "N"
      end


    else
      if @direction == "N"
        @direction = "W"
      elsif @direction == "W"
        @direction = "S"
      elsif @direction == "S"
        @direction = "E"
      else
        @direction = "N"
      end

    end
  end
end

class Plateau
  def initialize(x_length , y_length)
    @grid = Array.new(x_length){Array.new(x_length)}
  end
end


print "What's the plateau size: "
plateau_string = gets.chomp

print "First rover initial position and direction facing: "
rover_1_position = gets.chomp

print "First rover move sequence: "
rover_1_instructions = gets.chomp

print "Second rover initial position and direction facing: "
rover_2_position = gets.chomp

print "Second rover move sequence: "
rover_2_instructions = gets.chomp


puts "Output"
rover_1 = Rover.new(rover_1_position.chars[0],rover_1_position.chars[2],rover_1_position.chars[4])
rover_1.read_instruction(rover_1_instructions)
rover_2 = Rover.new(rover_2_position.chars[0],rover_2_position.chars[2],rover_2_position.chars[4])
rover_2
rover_2.read_instruction(rover_2_instructions)
