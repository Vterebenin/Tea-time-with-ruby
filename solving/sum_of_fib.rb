# count all dive

def fibUpTo(max)
  i1, i2 = 1, 1        # parallel assignment

  @count = 0
  @sum = 0
  while i1 <= max
  	yield i1
  	if ( (i1) % 2) == 0
  		@sum = @sum + i1
  		@count += 1
  	end
  	i1, i2 = i2, i1+i2
  end
  puts "\nThe total count of even numbers to #{max} was #{@count}"
  puts "The sum of all these numbers is #{@sum}"
end
fibUpTo(4000000) { |f| print f, " " }