class Shopping_Item
  def initialize (quantity, item_name, price)
    @quantity =
  end
end

print "What is the first item: "
item_line = gets.chomp

words = item_line.gsub(/\s+/m, ' ').strip.split(" ")

words.each {|word| puts word}

quantity = words[0]

item_name = words[1..-3]



price = words[-1]

puts "#{quantity} #{item_name} #{price}"
