def solution(number)
 	candidates = []
	(3..number-1).to_a.each { |elem| if (((elem % 5) == 0 ) || ((elem % 3) == 0 )) 
 																			candidates.push(elem)
 																		end }
 	return candidates.sum
end
solution(10)
# BP 
def solution(number)
  (1...number).select {|i| i%3==0 || i%5==0}.inject(:+)
end