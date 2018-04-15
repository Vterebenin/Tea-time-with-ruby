#The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
#Find the sum of all the primes below two million.
# im like to use the new and shine SIEVE ALGORYTHM

# Pseudocode:
# Input: an integer n > 1.
#  
#  Let A be an array of Boolean values, indexed by integers 2 to n,
#  initially all set to true.
#  
#  for i = 2, 3, 4, ..., not exceeding √n:
#    if A[i] is true:
#      for j = i2, i2+i, i2+2i, i2+3i, ..., not exceeding n: (i2 = i в квадрате) 
#        A[j] := false.
 
# Output: all i such that A[i] is true.
class NewSumprime
  attr_accessor :number
  # init
  def initialize(number)
    self.number = number
  end
  # sieve the primes from current number = n and store it into the sieve massive
  def sieve(n)
    sieve = [] # boolean
    root = Math.sqrt(n) # берем корень и числа
    # от 3 (1 не является праймом по умолчанию) до корня из числа с шагом 2 делаем 
    (3..root).step(2) do |i| 
      if !sieve[i] # if A[i] is false:
        (i**2..n).step(i) do |j| # for j = i2, i2+i, i2+2i, i2+3i, ..., not exceeding n:
          sieve[j] = true # A[j] := true.
        end
      end
    end
    [2] + (3..n).step(2).select{ |i| !sieve[i] }
  end

  def prime_serie
    sieve(number).inject(&:+)
  end
end
input = 2000000.to_i
ts = Time.now.to_f
puts "Cумма все чисел до числа #{input} получилась равной #{NewSumprime.new(input).prime_serie} "
puts "Времени затрачено: #{Time.now.to_f - ts}" 