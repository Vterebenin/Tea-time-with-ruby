=begin
You have to create a function that takes a positive integer number and returns
the next bigger number formed by the same digits:

next_bigger(12)==21
next_bigger(513)==531
next_bigger(2017)==2071
If no bigger number can be composed using those digits, return -1:

next_bigger(9)==-1
next_bigger(111)==-1
next_bigger(531)==-1

=end

def next_bigger1(n)
  splitted_array = []
	answer = []
	x = 0
	n = n.to_s.split('').reverse
	n.each_with_index do |e, i|
		if !n[i+1].nil? && (n[i] > n[i+1])
			x = n[i+1]
			splitted_array = n.take(i+1) 
			answer = n.drop(i+2)
			break
		end
	end
	splitted_array.sort.each_with_index do |e, i|
		if (splitted_array[i] > x)
			x, splitted_array[i] = splitted_array[i], x
			splitted_array.delete(i)
			break
		end
	end
	answer = (answer.reverse.push(x) + splitted_array).join('').to_i
	if answer == 0
		answer = -1
	else
		answer
	end
end

# BP
def next_bigger n
  max = maxed n
  (n+1..max).each { |i| return i if max == maxed(i) }
  -1
end

def maxed n
  n.to_s.split('').sort.reverse.join.to_i
end
t = Time.now
puts "Ответ: #{next_bigger(123456785123446789)}" 
puts "Время лучшего решения на сайте: #{Time.now - t} " 
t = Time.now
puts "Ответ: #{next_bigger1(123456785123446789)}"
puts "Время моего решения: #{Time.now - t} " 
