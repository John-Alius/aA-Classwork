# time complexity = o(n!)
def first_anagram?(str1, str2)
    str1.split("").permutation.to_a.include?(str2.split(''))
end

# n * 2m => nm # similar to n^2 / quadratic
def second_anagram?(str1, str2)
    split1 = str1.split('')
    split2 = str2.split('')
  
    split1.each do |letter| # n
        letter_index = split2.find_index(letter) # m
        return false if !letter_index
        split2.delete_at(letter_index) # m
    end

    split2.empty?
end

# log-linear
# n log n linearithmic
# nlogn + 2m
def third_anagram?(str1, str2)
  sorted1 = str1.chars.sort.join #chars =>n #sort:  n log n #join: n
  sorted2 = str2.chars.sort.join # n + n log n + n
  sorted1 == sorted2
end

# o(n + m) linear
def fourth_anagram?(str1, str2)
    hash_str1 = Hash.new(0)
    hash_str2 = Hash.new(0)

    str1.each_char { |letter| hash_str[letter] += 1 }
    str2.each_char { |letter| hash_str[letter] += 1 }

    hash_str1 == hash_str2

end

# o(n) linear, space advantage
def fifth_anagram?(str1, str2)
    hash_str = Hash.new(0)

    str1.each_char { |letter| hash_str[letter] += 1 }
    str2.each_char { |letter| hash_str[letter] -= 1 }

    hash_str.values.all? {|value| value == 0 }

end

p fifth_anagram?("gizmo", "sally")    #=> false
p fifth_anagram?("elvis", "lives")    #=> true
