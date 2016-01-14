class Person
  attr_writer :name
  def initialize (name)
    @name = name
  end

  def greeting
    puts "Hi, my name is #{@name}"
  end
end

class Student < Person
  def learn
    puts "I get it!"
  end
end

class Instructor < Person
  def teach
    puts "Everything in Ruby is an Object"
  end
end

chris = Instructor.new("Chris")

chris.greeting

christina = Student.new("Christina")

christina.greeting

chris.teach

christina.learn

christina.teach # Won't work because Christina is a student, student class has no access to teach method
