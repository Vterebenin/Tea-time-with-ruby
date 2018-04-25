def unique_in_order(iterable)

  if !iterable.kind_of?(Array)
    iterable = iterable.to_s.split('').to_a
  end
  i = 0
  while i < iterable.length do
  	#print iterable
  	while iterable[i] == iterable[i+1]
  		iterable.delete_at(i)
  		#print iterable
  	end
  	i += 1 
  end 
  return iterable
end
#print unique_in_order('AAAABBBCCDAABBB')
print unique_in_order([1,2,2,3])