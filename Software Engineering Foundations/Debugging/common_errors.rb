# SyntaxError

def check_num(num)
    if num > 0
        p "positiive"
    elsif num < 0 # was => else if num < 0
        p "negative"
    else
        p "zero"
    end
end

check_num(42)

# NameError

p "my_var" # was => p my_var

# NoMethodError

# say_hello("Erik")
# nil.upcase

# ArgumentError

def say_hi(first_name, last_name)
    p "Hello " + first_name + " " + last_name
end

# say_hi("Erik")

# TypeError

# 5 + "dog"