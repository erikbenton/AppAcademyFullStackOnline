def what_sign(num)
	if num > 0
		puts "positive"
	elsif num < 0
		puts "negative"
	else
		puts "zero"
	end
end

def analyze_number(num)
	what_sign(num)
	if num % 2 == 0
		puts "It's even"
	else
		puts "It's odd"
	end
end

def is_div_by_5(num)

	return num % 5 == 0
end

def either_only(number)

	if number % 3 == 0 && number % 5 != 0
		return true
	elsif number % 3 != 0 && number % 5 == 0
		return true
	end
	return false
end

def large_number(num1, num2)
	if num1 > num2
		return num1
	else
		return num2
	end
end

def longer_string(str1, str2)
	if str1.length >= str2.length
		return str1
	end
	return str2
end

def word_check(word)
	if word.length > 6
		return "long"
	elsif word.length == 6
		return "medium"
	end
	return "short"
end

def count_e(word)
	count = 0
	for i in 0...word.length
		if word[i] == 'e' || word[i] == 'E'
			count += 1
		end
	end
	return count
end

def count_vowels(word)
	count = 0
	for i in 0...word.length
		char = word[i]
		if char == 'a' || char == 'e' || char == 'i' || char == 'o' || char == 'u'
			count += 1
		end
	end
	return count
end

def sum_nums(max)
	sum = 0
	for i in 1..max
		sum += i
	end
	return sum
end

def reverse(word)
	result = ""
	for i in 0...word.length
		char = word[i]
		result = char + result
	end
	return result
end

def is_palindrome(word)
	last = word.length - 1
	first = 0
	res = true
	while first < last
		if word[first] != word[last]
			res = false
			break
		end
		first += 1
		last -= 1
	end
	return res
end

def doubler(numbers)

	for i in 0...numbers.length
		numbers[i] *= 2
	end
	return numbers
end

def yell(words)

	for i in 0...words.length
		words[i] += "!"
	end
	return words
end

def element_times_index(numbers)

	for i in 0...numbers.length
		numbers[i] *= i
	end
	return numbers
end

def even_nums(max)
	array = []

	for i in 0...max
		if i % 2 == 0
			array << i
		end
	end
	return array
end

def range(min, max)
	array = []
	for i in min..max
		array << i
	end
	return array
end

def odd_range(min, max)
	array = []
	for i in min..max
		if i % 2 == 0
			array << i
		end
	end
	return array
end

def reverse_range(min, max)
	array = []
	i = max  - 1
	while i > min
		array << i
		i -= 1
	end
	return array
end

def first_half(array)

	length = (array.length / 2) + (array.length % 2)
	res = []
	for i in 0...length
		res << array[i]
	end
	return res
end

def factors_of(num)
	res = []
	for i in 1..num
		if num % i == 0
			res << i
		end
	end
	return res
end

def select_odds(numbers)

	res = []
	for i in 0...numbers.length

		if numbers[i] % 2 == 1
			res << numbers[i]
		end

	end
	return res
end

def select_long_words(words)
	res = []
	for i in 0...words.length
		if words[i].length > 4
			res << words[i]
		end
	end
	return res
end

def sum_elements(arr1, arr2)
	res = []
	for i in 0...arr1.length
		res << arr1[i] + arr2 [i]
	end
	return res
end

def fizz_buzz(max)
	res = []
	for number in 1...max
		if number % 4 == 0 && number % 6 != 0
			res << number
		elsif number % 4 != 0 && number % 6 == 0
			res << number
		end
	end
	return res
end

def test_buzz(max)
	arr = []
	(1...max).each do |num|
		puts num
	end
end

def to_initials(name)

	name_array = name.split(" ")
	res = ""
	name_array.each { |word| res += word[0]}
	return res
end

def first_in_array(arr, el1, el2)
	if arr.index(el1) < arr.index(el2)
		return el1
	end
	return el2
end

def abbreviate_sentence(sent)
	sent_array = sent.split(" ")
	res = []
	sent_array.each do |word|
		if word.length > 4
			word = remove_vowels(word)
		end
		res << word
	end
	return res.join(" ")
end

def remove_vowels(word)
	vowels = "aeiouAEIOU"
	vowels_array = vowels.split("")
	vowels_array.each do |vowel|
		if(word.include?(vowel))
			word = word.split(vowel).join("")
		end
	end
	return word
end

def format_name(str)
	str_array = str.downcase.split(" ")
	str_array.each { |name| name[0] = name[0].upcase }
	str = str_array.join(" ")
	return str
end

def format_name2(str)
	str_array = str.downcase.split(" ")
	str_array.each_with_index do |name, idx|
		name[0] = name[0].upcase
		str_array[idx] = name
	end
	str = str_array.join(" ")
	return str
end

def is_valid_name(str)
	is_valid = true
	names = str.split(" ")
	if names.length < 2
		return false
	end
	compare = format_name(str)
	puts compare
	puts str
	return str == compare
end

def is_valid_email(str)
	parts = str.split("@")
	if parts.length != 2
		return false
	end
	if parts[0].downcase != parts[0]
		return false
	end
	numbers = "0123456789"
	numbers_array = numbers.split("")
	numbers_array.each do |number|
		if parts[0].include?(number)
			return false
		end
	end
	if parts[1].split(".").length != 2
		return false
	end
	return true
end

def array_translate(array)
	res = ""
	idx = 0
	while idx < array.length
		phrase = array[idx]
		num = array[idx + 1]
		num.times { res += phrase }
		idx += 2
	end
	return res
end

def reverse_words(sent)
	words = sent.split(" ")
	words.each { |word| word.reverse!}
	return words.join(" ")
end

def rotate_array(arr, num)
	num.times do
		temp = arr.pop
		arr.unshift(temp)
	end
	return arr
end

def pig_latin_word(word)
	vowels = "aeiouAEIOU"
	if vowels.include?(word[0])
		return word + "yay"
	end
	word.each_char.with_index do |char, idx|
		if vowels.include?(char)
			return word[idx..-1] + word[0...idx] + "ay"
		end
	end
end

def combinations(arr)
	res = []
	arr.each_with_index do |ele1, idx1|
		(idx1+1...arr.length).each do |idx2|
			res << [ele1, arr[idx2]]
		end
	end
	return res
end

def opposite_count(nums)
	res = 0
	nums.each_with_index do |ele1, idx1|
		(idx1+1...nums.length).each do |idx2|
			if ele1 + nums[idx2] == 0
				res += 1
			end
		end
	end
	return res
end

def two_d_sum(arr)
	sum = 0
	arr.each do |sub_arr|
		sub_arr.each { |num| sum += num }
	end
	return sum
end

def two_d_translate(arr)
	res = []
	arr.each do |sub_arr|
		ele = sub_arr[0]
		num = sub_arr[1]
		num.times { res << ele }
	end
	return res
end

def get_double_age(hash)
	return hash["age"] * 2
end

def get_full_name(hash)
	return hash["first"] + " " + hash["last"] + ", the " + hash["title"]
end

def word_lengths(sentence)
	res = Hash.new { |hash, key| hash[key] = key.length }
	sentence_arr = sentence.split(" ")
	sentence_arr.each { |word| res[word] }
	return res
end

def retrieve_values(hash1, hash2, key)
	return [hash1[key], hash2[key]]
end

def cat_builder(name_str, color_str, age_num)
	hash = {
		"name" => name_str,
		"color" => color_str,
		"age" => age_num
	}
	return hash
end

def ae_count(str)
	counter = Hash.new(0)
	str.each_char do |char|
		if char == "a" || char == "e"
			counter[char] += 1
		end
	end
	return counter
end

def element_count(arr)
	counter = Hash.new(0)
	arr.each { |ele| counter[ele] += 1 }
	return counter
end

def select_upcase_keys(hash)
	res = {}
	hash.each do |key, val|
		if key.upcase == key
			res[key] = val
		end
	end
	return res
end

def hand_score(hand)
	card_points = {
		"A" => 4,
		"K" => 3,
		"Q" => 2,
		"J" => 1
	}
	score = 0
	hand.each_char { |key| score += card_points[key.upcase] }
	return score
end

def frequent_letters(string)
	res = []
	counter = Hash.new(0)
	string.each_char { |char| counter[char] += 1 }
	counter.each do |key, val|
		if val > 2
			res << key
		end
	end
	return res
end

def hash_to_pairs(hash)
	res = []
	hash.each { |key, val| res << [key, val] }
	return res
end

def unique_elements(arr)
	res = {}
	arr.each { |val| res[val] = val }
	return res.keys
end

def element_replace(arr, hash)
	res = []
	arr.each do |entry|
		if hash.has_key?(entry)
			res << hash[entry]
		else
			res << entry
		end
	end
	return res
end

def map_by_name(arr)
	res = arr.map { |ele| ele["name"]}
	return res
end

def map_by_key(arr, key)
	return arr.map { |ele| ele[key] }
end

def yell_sentence(sent)
	arr = sent.split(" ")
	return (arr.map { |word| word.upcase + "!"}).join(" ")
end

def whisper_words(words)
	return words.map { |word| word.downcase + "..."}
end

def o_words(sentence)
	arr = sentence.split(" ")
	return arr.select { |word| word.include?("o")}
end

def last_index(str, char)
	res = []
	arr = str.split("")
	arr.map.with_index do |letter, idx|
		if letter == char
			res << idx
		end
	end
	return res[-1]
end

def most_vowels(sentence)
	vowels = "aeiouAEIOU"
	words = sentence.split(" ")
	vowel_count = Hash.new(0)
	words.each do |word|
		word.each_char do |char|
			if vowels.include?(char)
				vowel_count[word] += 1
			end
		end
	end
	return (vowel_count.sort_by { |key, val| val })[-1][0]
end

def prime?(num)
	if num < 2
		return false
	end
	(2...num).each do |div|
		if num % div == 0
			return false
		end
	end
	return true
end

def pick_primes(numbers)
	return numbers.select { |num| prime?(num)}
end

def prime_factors(num)
	factors = Hash.new { |hash, key| hash[key] = true }
	(2..num).each do |val|
		if num % val == 0
			factors[val]
		end
	end
	return pick_primes(factors.keys)
end

def greatest_factor_array(arr)
	res = []
	arr.each do |num|
		if prime?(num)
			res << num
		else
			div = 1
			ans = num
			factors = []
			while div < ans
				div += 1
				ans = num / div
				if num % div == 0
					factors.push(div, ans)
				end
			end
			res << (factors.sort)[-1]
		end
	end
	return res
end

def perfect_square?(num)
	(1..num).each do |val|
		square = val * val
		if square == num
			return true
		elsif square > num
			return false
		end
	end
	return false			
end

def triple_sequence(start, length)
	res = [start]
	(length - 1).times do
		res << res[-1] * 3
	end
	return res
end

print triple_sequence(2, 4) # => [2, 6, 18, 54]
puts
print triple_sequence(4, 5) # => [4, 12, 36, 108, 324]
puts