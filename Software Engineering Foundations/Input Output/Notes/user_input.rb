# Getting Input
p "Please enter your name:"
name = gets
p "Hello, #{name}"

puts "Enter 'y' for Yes or 'n' for No:"
ans = gets # Captures ending '\n'
if ans == "y"
  puts "Yeah!"
elsif ans == "n"
  puts "Nah..."
else
  puts "Neither, oof =/"
end

puts "Let's try chomping that"
puts "Enter 'y' for Yes or 'n' for No"
ans = gets.chomp # Chomps trailing '\n'
if ans == "y"
  puts "Yeah!"
elsif ans == "n"
  puts "Nah..."
else
  puts "Neither, oof =/"
end

# Converting to numbers
puts "Enter your favorite integer:"
fav_int = gets.chomp.to_i
if fav_int.is_a?(Integer)
  puts "So #{fav_int} is your favorite integer."
else
  puts "That's not an int =("
end

puts "Enter your favorite number:"
fav_num = gets.chomp.to_f
if fav_num.is_a?(Numeric)
  puts "So #{fav_num} is your favorite number."
else
  puts "That's not a number =("
end
