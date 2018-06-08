def increment_string(input)
	if /[0-9]/.match(input.chars.last)
		a = []
		input.chars.each_with_index { |e, i| /[0-9]/.match(e) &&
																			 ( /[0-9]/.match(input[i+1]) || input[i+1] == nil ) ? a.push(e) : a = [] } 
		a.length.times { input.slice!(input.length - 1)	}
		input + a.join('').to_s.next
	else
		input + "1"
	end
end
p increment_string("ff1f9")
p increment_string("fff1")
p increment_string("fff")

# BP 
def increment_string(input)
  input.sub(/\d*$/) { |n| n.empty? ? 1 : n.succ }
end