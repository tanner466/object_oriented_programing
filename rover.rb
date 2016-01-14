class Rover
  attr_reader :x_coord, :y_coord, :direction
  def initialize(x_coord , y_coord , direction)
    @x_coord = x_coord.to_i
    @y_coord = y_coord.to_i
    @direction = direction

  end

  def read_instruction(instruction)
    instruction.each_char  do |char|
      if char.upcase=="M"
        move
      else
        turn(char.upcase)
      end
    end

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
    @grid = Array.new(x_length.to_i){Array.new(x_length.to_i)}
  end

  def occupied?(x , y)
    if @grid[x.to_i][y.to_i] == "1"
      return true
    else
      return false
    end
  end

  def occupy (x , y)
    @grid[x.to_i][y.to_i] = "1"
  end
end

class Mission_Control
  def initialize
    @rovers = Array.new
    @rover_index = 1
  end
  def create_rover
    print "Initial position and direction facing of Rover #{@rover_index}: "
    position_string = gets.chomp
    direction = position_string[-1]
    position_string[-1]=""
    positions=position_string.gsub(/\s+/m, ' ').strip.split(" ")
    new_rover = Rover.new(positions[0],positions[1],direction)
    @rovers.push(new_rover)
    @rover_index += 1
  end
  def give_instructions
    index = 1

    @rovers.each do |rover|
      puts "Rover #{index}. #{rover.x_coord} #{rover.y_coord} #{rover.direction} "
      index += 1
    end
    print "Which rover do you want to move: "
    rover_chosen = gets.chomp.to_i

    if (rover_chosen > 0 && rover_chosen <= @rovers.length )
      print "Movement string for Rover #{rover_chosen}: "
      movement_string = gets.chomp
      @rovers[rover_chosen-1].read_instruction(movement_string)
      puts "Rover #{rover_chosen} is now at #{@rovers[rover_chosen-1].x_coord} #{@rovers[rover_chosen-1].y_coord} facing #{@rovers[rover_chosen-1].direction}"
    end
  end
  def show_rovers
    index = 1

    @rovers.each do |rover|
      puts "Rover #{index}. is at #{rover.x_coord} #{rover.y_coord} facing #{rover.direction} "
      index += 1
    end
  end
end

mc = Mission_Control.new

print "What is the plateau size: "
plateau_string = gets.chomp
plateau_x_y = plateau_string.gsub(/\s+/m, ' ').strip.split(" ")
the_plateau = Plateau.new(plateau_x_y[0] , plateau_x_y[1])

continue_program = true
while continue_program
  puts "1. Add Rover"
  puts "2. Move Rover"
  puts "3. Show All Rovers"
  puts "Q to quit"
  print "What would you like to do: "
  choice = gets.chomp
  if choice.upcase == "Q"
    continue_program = false
  elsif choice == "1"
    mc.create_rover

  elsif choice == "2"
    mc.give_instructions

  elsif choice == "3"
    mc.show_rovers

  end
end


# print "What's the plateau size: "
# plateau_string = gets.chomp
#
# print "First rover initial position and direction facing: "
# rover_1_position = gets.chomp
#
# print "First rover move sequence: "
# rover_1_instructions = gets.chomp
#
# print "Second rover initial position and direction facing: "
# rover_2_position = gets.chomp
#
# print "Second rover move sequence: "
# rover_2_instructions = gets.chomp
#
# puts "Output"
# rover_1_direction = rover_1_position[-1]
# rover_1_position[-1]=""
# positions=rover_1_position.gsub(/\s+/m, ' ').strip.split(" ")
#
# rover_1 = Rover.new(positions[0],positions[1],rover_1_direction)
# rover_1.read_instruction(rover_1_instructions)
#
#
# rover_2_direction = rover_2_position[-1]
# rover_2_position[-1]=""
# positions=rover_2_position.gsub(/\s+/m, ' ').strip.split(" ")
#
# rover_2 = Rover.new(positions[0],positions[1],rover_2_direction)
# rover_2.read_instruction(rover_2_instructions)
