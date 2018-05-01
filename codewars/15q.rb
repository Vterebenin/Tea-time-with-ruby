# Pascal triangle on ruby.
# Returns a array full of pascal triangle elements

def pascalsTriangle(n)
  a = [] 
  i = 0
  if n == 0 || n < 0 || n == 1
  	a << 1
  else  
  	a.push(1,1,1)
  	i = 2
  	while i < n 
  		a.push(1)
  		(i-1).times do
  			a.push(a[a.length-i] + a[a.length-i-1])
  		end
  		a.push(1)
  		i += 1
  	end
  end
  a
end

p pascalsTriangle(10)