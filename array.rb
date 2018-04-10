# вариант 1
class Array
	def find
		for i in 0...size
			value	=	self[i]
			return value if yield(value)
		end
		return nil
	end
end

puts [1,3,5,7,9].find {|v| v*v > 30 }

puts [1,3,5].each {|i| puts i }


puts ["H", "A", "L"].collect { |x| x.succ }

# вариант 2
class Array
  def inject(n)
     each { |value| n = yield(n, value) }
     n
  end
  def sum
    inject(0) { |n, value| n + value }
  end
  def product
    inject(1) { |n, value| n * value }
  end
end
puts [ 1, 2, 3, 4, 5 ].sum	
puts [ 1, 2, 3, 4, 5 ].product

# Вариант 3

module Inject
	def inject(n)
		each do |value|
			n = yield(n, value)
		end		
	end

	def sum(initial = 0)
		inject(initial) { |n, value| n + value }
	end
	def product(initial = 1)
		inject(initial) { |n, value| n * value }
	end
end

class Array
	include Inject
end
[ 1, 2, 3, 4, 5 ].sum	#	15
[ 1, 2, 3, 4, 5 ].product # 120

class Range
	include Inject
end

(1..5).sum # 15
(1..5).product # 120
('a'..'m').sum("Letters: ") # "Letters: abcdefghijklm"



