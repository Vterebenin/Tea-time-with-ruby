
# Программа находит наибольший простой делитель для заданного числа
# здесь приведено два решения с разным временем выполнения
# метод, который определяет является ли число простым
def is_prime(n)
	for d in 2..(n-1) 
		if (n % d) == 0 
			# если делится на что-либо кроме себя самого и 1, то уже не простое
			return false 
		end
	end
	true
end

# метод, который создает массив из делителей числа 
# и находит самое большое простое из них 
def largestPrimeFactor(number)

	@divider = []
	@result = 0
	if number < 1000000
		for i in 2..(number/2)
			if number % i == 0
				@divider.push(i) # находим делители числа без остатка
			end
		end
	else
		for i in 2..(Math.sqrt(number))
			if number % i == 0
				@divider.push(i) # находим делители числа без остатка
			end
		end
	end 
	# делаем массив реверсивным для более быстрого 
	# нахождения наибольшего простого из них
	@divider = @divider.sort.reverse 
	# перебираем реверсивный массив
	for i in 0..@divider.length
		# Если число простое 
		if is_prime(@divider[i]) 
			@result = @divider[i] # то присваеваем его результату
			break
		end
	end
	puts "Наибольший простой делитель числа #{number}: #{@result}"
end
s = Time.new

largestPrimeFactor(600851475143)
puts "Времени затрачено: #{Time.new-s}"

# Это самое быстрое из возможных решений нахождения
def largestAndFastestPrimeFactor(x)
  prime = x
  (2..Math.sqrt(x).to_i).each do |i|
    break if prime <= i
    prime /= i while (prime > i && prime % i == 0)
  end
  prime
end

s = Time.new
puts largestAndFastestPrimeFactor(600851475143)
puts "Времени затрачено: #{Time.new-s}"

# Результаты:
# Наибольший простой делитель числа 600851475143: 6857
# Времени затрачено: 0.2031038
# 6857
# Времени затрачено: 0.005762