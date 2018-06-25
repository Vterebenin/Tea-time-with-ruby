# my first generation
def zeros(n)
	a = ((1..n).inject(:*) || 1)
  			 .to_s.reverse
  a.slice!(a.to_i.to_s)
  a.length
end
p zeros(0)

# my second generation
def zeros(n)
  return 0 if n.zero?
  k = (Math.log(n)/Math.log(5)).to_i
  m = 5**k
  n*(m-1)/(4*m)
end

# VERY BP
def zeros1(n)
  n < 5 ? 0 : (n / 5) + zeros(n / 5)
end

T = Time.now
p zeros(52352152152352333321123412)
p "Time: #{Time.now - T}" 
s = Time.now
p zeros1(52352152152352333321123412)
p "Time: #{Time.now - s}"
