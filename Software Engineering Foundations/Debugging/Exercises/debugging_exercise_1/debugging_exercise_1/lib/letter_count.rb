# Debug this code to pass rspec! There are 3 mistakes to fix.

# Write a method, letter_count, that accepts a string and char as args. 
# The method should return the number of times that the char appears in the string.

require "byebug"

# Had to initialize count to 0, not nil
# Had to actually compare c == char, not c = char
# Had make sure to put everything in same case (downcase)

def letter_count(string, char)
    count = 0
    string.each_char do |c| 
        count += 1 if c.downcase == char.downcase 
    end
    count
end