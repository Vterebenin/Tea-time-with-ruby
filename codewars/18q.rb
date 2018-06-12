=begin
Common denominators
You will have a list of rationals in the form
 [ [numer_1, denom_1] , ... [numer_n, denom_n] ]
where all numbers are positive ints.
You have to produce a result in the form
 [ [N_1, D] ... [N_n, D] ]
depending on the language (See Example tests)
in which D is as small as possible and
 N_1/D == numer_1/denom_1 ... N_n/D == numer_n,/denom_n.
Example:
convertFracs [(1, 2), (1, 3), (1, 4)] `shouldBe` [(6, 12), (4, 12), (3, 12)]
=end

# im a pro B)
def convertFracts(lst)
	d = lst.reduce(1) {|x,y| x.lcm(y[1]) }
	lst.map {|x| [d/x[1]*x[0],d] }
end
t = Time.now
p convertFracts([[69, 130], [87, 1310], [3, 4]])
p Time.now - t

# BP
def convertFracts(lst)
  lcm = lst.reduce(1) { |x,y| x.lcm(y[1]) }
  lst.map { |x| [lcm/x[1]*x[0], lcm] }
end
t = Time.now
p convertFracts([[69, 130], [87, 1310], [3, 4]])
p Time.now - t
# random outputs
# [[18078, 34060], [2262, 34060], [25545, 34060]]
# 0.000336
# [[18078, 34060], [2262, 34060], [25545, 34060]]
# 0.0006745