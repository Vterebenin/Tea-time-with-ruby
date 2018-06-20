=begin 
In number theory and combinatorics, a partition of a positive integer n, also 
called an integer partition, is a way of writing n as a sum of positive 
integers. Two sums that differ only in the order of their summands are considered 
the same partition. If order matters, the sum becomes a composition. For 
example, 4 can be partitioned in five distinct ways:

4
3 + 1
2 + 2
2 + 1 + 1
1 + 1 + 1 + 1
How many ways can you make the sum of a number n?
=end

# my solution
def exp_sum1(n)
	$pn = []
	def p1(n)
	  return 1 if n == 0
	  return 0 if n < 0
	  return $pn[n] if $pn[n]
	  sum = 0
	  (1..n).each do |k|
	    sum += ((-1)**(k+1)) * (p1(n-(k*(3*k-1))/2) + p1(n-(k*(3*k+1))/2))
	    $pn[n] = sum
	  end
	  sum
	end
	p1(n)
end

# BP
ExpCache = {}
def exp_sum n, k = n
  return 0 if n < 0
  return 1 if k == 1
  case n
  when 0, 1 then 1
  else
    ExpCache[[n, k]] ? ExpCache[[n, k]] : ExpCache[[n, k]] = (n - k > k) ? (
      (n-k..n-1).map { |e| exp_sum e, n - e }.inject :+
    ) : (exp_sum(n - k) + exp_sum(n, k - 1))
  end
end
# my
t = Time.now
puts exp_sum1(1000)
puts Time.now - t
# codewars pro's
t = Time.now
puts exp_sum(1000)
puts Time.now - t

# wait a second there. 
# my script is a lot faster, than codewars BP. like a loooot. try it.
# well, math > array sorting