def find_outlier(integers)
 	summ = 0
 	k = 0
	integers.each { |x| if x % 2 == 0 
												summ += x; k += 1; 
											end }
	return (integers.sum - summ) if k > 1
	summ if k == 1
end
print find_outlier([2, 4, 0, 100, 4, 11, 2602, 36])
print find_outlier([1, 2, 3])
# BP
def find_outlier(integers)
  integers.partition(&:odd?).find(&:one?).first
end
puts 
print find_outlier([2, 4, 0, 100, 4, 11, 2602, 36])
print find_outlier([1, 2, 3])
