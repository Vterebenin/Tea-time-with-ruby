def sum_dig_pow(a, b)
  array = (a..b).to_a.each { |x| x.to_s.split('') }
  sum = 0
  answer = []
  array.each do |x|
  	x.to_s.split('').each_with_index { |number, index | number = number.to_i**(index+1); sum += number }
  	if sum == x 
  		answer.push(x)
  	end
  	sum = 0
  end
  answer
end
sum_dig_pow(10, 100)

def sum_dig_pow(a, b)
  (a...b).select { |n| n == n.to_s.chars.map.with_index(1) { |e, i| e.to_i ** i }.reduce(:+) }
end