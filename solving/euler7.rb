#By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

#What is the 10 001st prime number?
# не выдержал и загуглил решение на стаковерфлоу. уж очень интересна была мне задача
def prime_at(x)
	s = Time.new
  primes = [2,3] # непонятно зачем нам эти числа в массиве изначально. 
  							 # видимо искать первое простое бессмысленно.
  							 # так или иначе, программа зависает если в качестве аргумента выбрать 1
  							 # поэтому я сделал исключение. А еще по привычке время добавил
  n = 4 
  if x == 1
 		puts "#{x}-е просто число: #{primes.first}"
 		puts "Времени затрачено: #{Time.new-s}"
 	else
 		until primes.length == x # пока не достигнем заданного числа
  	# Добавляем в конец массива число, если в массиве каждый элемент
  	# при делении на N даст ненулевой остаток 
    	primes << n if primes.all? {|p| n % p > 0 } # 
    # увеличиваем счетчик
    	n += 1
  	end
  	# Выводим последнее
  	puts "#{x}-е просто число: #{primes.last}"
  	puts "Времени затрачено: #{Time.new-s}"
 	end 
end
prime_at(1)
prime_at(6)
prime_at(10001)

# Результаты работы прогарммы 
# 1-е просто число: 2
# Времени затрачено: 0.0006777
# 6-е просто число: 13
# Времени затрачено: 9.62e-05
# 10001-е просто число: 104743
# Времени затрачено: 4.1495535