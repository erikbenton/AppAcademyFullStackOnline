# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

# Resposible for getting the (non-obvious) factors
# of the given number and returning an array
def get_factors(number)
	# Select the entries that evenly divide input
	res = (2...number).select { |num| number % num == 0 }
	return res
end

def coprime_me?(num1, num2)
	# Get the factors for both the numbers
	factors1 = get_factors(num1)
	factors2 = get_factors(num2)
	# Nested loops to compare each entry in factor arrays
	factors1.each do |factor1|
		factors2.each do |factor2|
			# If there is a common factor
			if factor1 == factor2
				return false
			end
		end
	end
	# No common factors found
	return true
end

def coprime?(num1, num2)
	if num1 == 0 || num2 == 0
		return false
	end
	if num1 == num2
		return num1 == 1
	end
	min = num1 < num2 ? num1 : num2
	(2..min).each do |div|
		if num1 % div == 0 && num2 % div == 0 && div != 1
			return false
		end
	end
	return true
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false