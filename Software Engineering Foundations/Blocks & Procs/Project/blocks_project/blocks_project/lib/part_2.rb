def all_words_capitalized?(words)
  words.all? { |word| word == word.capitalize }
end

def no_valid_url_me?(urls)
  invalid = [".com", ".net", ".io", ".org"]
  urls.none? do |url|
    invalid.any? { |ext| url.include?(ext) }
  end
end

def no_valid_url?(urls)
  invalid = [".com", ".net", ".io", ".org"]
  urls.none? do |url|
    invalid.any? { |ext| url.end_with?(ext) }
  end
end

def any_passing_students_me?(students)
  students.any? do |student|
    sum = student[:grades].inject { |sum, score| sum  += score }
    (sum / student[:grades].length.to_f) > 75
  end
end

def any_passing_students?(students)
  students.any? do |student|
    student[:grades].sum / student[:grades].length.to_f > 75
  end
end