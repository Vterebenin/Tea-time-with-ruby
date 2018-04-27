def palindrome_chain_length(n)
	count = 0
	until n.to_s == n.to_s.reverse!
		n += n.to_s.reverse!.to_i 
		count += 1
	end
	count
end

p palindrome_chain_length(87)
p palindrome_chain_length(88)
# BP 
def palindrome_chain_length(n)
  n.to_s == n.to_s.reverse ? 0 : 1 + palindrome_chain_length(n + n.to_s.reverse.to_i)
end
p palindrome_chain_length(87)
p palindrome_chain_length(88)