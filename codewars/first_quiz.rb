def dig_pow(n, p)
	a = []
	a = n.to_s.split('').to_a
	i = 0
	while (i < a.length) do
		sum = sum.to_i
		sum += (a[i].to_i)**(i+p) 
		i += 1
	end
	if (sum % n) == 0 
		puts (sum / n)
	else
		puts -1
	end
end
dig_pow(89, 1)
dig_pow(92, 1)
dig_pow(46288, 3)