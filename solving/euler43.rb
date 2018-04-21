# The number, 1406357289, is a 0 to 9 pandigital number because it is made up of 
# each of the digits 0 to 9 in some order, but it also has a rather 
# interesting sub-string divisibility property.

# let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following
# d2d3d4 = 406 is divisible by 2
# d3d4d5 = 063 is divisible by 3
# d4d5d6 = 635 is divisible by 5
# and so on
# Find the sum of all 0 to 9 pandigital numbers with this property.

primes = [1,2,3,5,7,11,13,17] 
# for all permutation of a 0..9 array, select digits
puts ('0'..'9').to_a.permutation.select { |digits| 
  (1..7).all? { |i|
    digits[i..i+2].join('').to_i % primes[i] == 0
  }
}.map { |digits| digits.join('').to_i }.reduce(:+)