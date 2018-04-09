a = [1, 2, 3, 4]
b, 	c = a 				# this is gona be b=1, c=2
b, *c = a					# b=1 c == [2, 3, 4]
b, 	c = 99, a			# b == 99, c == [1, 2, 3, 4]
b, *c = 99, a			# b == 99, c == [[1, 2, 3, 4]]
b, 	c = 99, *a		# b == 99, c == 1
b, *c = 99, *a		# b == 99, c == [1, 2, 3, 4]

# one more worth mentioning feature
# The left side of an assignment may contain a parenthesized list of terms
b, (c, d), e = 1,2,3,4 			# b == 1, c == 2, d == nil, e == 3
b, (c, d), e = [1,2,3,4] 		# b == 1, c == 2, d == nil, e == 3
b, (c, d), e = 1,[2,3],4 		# b == 1, c == 2, d == 3, e == 4
b, (c, d), e = 1,[2,3,4],5 	# b == 1, c == 2, d == 3, e == 5
b, (c,*d), e = 1,[2,3,4],5 	# b == 1, c == 2, d == [3, 4], e == 5

