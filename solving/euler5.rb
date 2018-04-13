# Вот такую функцию я написал изначально для решения этой задачи
def smallestMultiply(n,m)
	@number = m
	@counter = 0
	while @number >= m 
		for i in n..m
			if (@number % i) == 0
				@counter += 1
			else
				@counter = 0 
				break
			end
			if @counter == m
				puts @number
			end
		end
		@number = @number + m
		if @counter == m 
			break
		end
	end
end

s = Time.new

smallestMultiply(1,20)

puts "Времени затрачено: #{Time.new-s}"
s = Time.new
# А потом узнал про ЭТО. 
puts (1..20).reduce(:lcm)
puts "Времени затрачено: #{Time.new-s}"

# результаты работы кода
# 232792560
# 20
# Времени затрачено: 8.6229904
# 232792560
# Времени затрачено: 7.29e-05
# 

# Иногда я чувствую себя таким идиотом.