# Enumeration
if false
	p [[1,2,3],["a","b"]].flatten
	p [2,4,6].all? { |num| num.even? }
	p [2,4,6].any? { |num| num.odd? }
	p [3,5,7].none? { |num| num.even? }
	p [1,2,3,4,5,6,7].count { |num| num.odd? }
end

# Symbols
if false
	puts "Symbols - Intro"
	sym = :hello 	# Immutable
	# sym[1] = "x" - Not allowed
	str = "hello" # Mutable
	str[1] = "x" # Allowed
	p sym
	p str
	puts "------------"
	# More examples
	puts "Location in memory"
	puts "String"
	p "hello".object_id
	p "hello".object_id
	p "hello".object_id
	p "hello".object_id
	puts "Symbol"
	p :hello.object_id
	p :hello.object_id
	p :hello.object_id
	p :hello.object_id
	puts "------------"
	# Used as Hash keys
	puts "Hash Keys"
	bootcamp = {name:"App Academy", color:"red"}
	p bootcamp
	p bootcamp[:name]
	puts "------------"
end

# Default Args and Option Hashes
if false
	def repeat(str, n=1)
		p str * n
	end
	repeat("Hey ")
	repeat("Yo ", 3)

	def print_h(name, hash)
		p name
		p hash
	end
	# Do not need {} for hash args
	print_h("Erik", city:"SEA", color:"red")
end

# Splat Operator
if false
	
	# Groups "trailing" args into array
	def say_hello_splat(first, *rest)
		p first
		p rest
	end
	say_hello_splat("Erik", "Benton", "The Great")
	
	# Unpacks array - removes out [] or {}
	def say_hello(first, last)
		p first
		p last
	end
	arr = ["a","z"]
	say_hello(*arr)
	
	teachers = ["Oliver", "Simcha", "Tommy"]
	new_teachers = [*teachers, "Alex", "Sarah"]
	p teachers
	p new_teachers
	
	# Unpacking hashes requires keys to be symbols 
	hash = { a:1, b:2 }
	new_hash = { **hash, c:3, d:4 }
	p hash
	p new_hash

	# Cool use for splat
	arr = *(0..5)
	p arr
end

# Inject Operator - Think of as reduce()
if true
	temp_arr = [11, 7, 2, 4]

	# Uses first val as accumulator (acc)
	sum = temp_arr.inject { |acc, el| acc + el }
	p sum

	# Reduce to the minimum value
	min = temp_arr.inject do |acc, el|
		if el < acc
			el
		else
			acc
		end
	end
	p min

	# Initializes the accumulator to 100
	sum = temp_arr.inject(100) { |acc, el| acc + el }
	p sum

	arr = [2, 3, 1, 7]
	res = arr.inject { |acc, el| acc + el }
	p res

end
