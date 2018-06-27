#first generation

def middle_permutation(string)
	a = string.split('').permutation(string.length).to_a.sort
	a[(a.length)/2-1].join('')	
end
#google it
def middle_permutation(string) 
	string = string.chars.sort.join("")
	return string if string.length <= 2

	if string.length.even?
		middle = string.length / 2 - 1
		remainder = string[0...middle] + string[middle+1..-1]
		string[middle] + remainder.reverse
	else
		middle = string.length / 2
		remainder = string[0...middle-1] + string[middle+1..-1]
		string[middle] + string[middle-1] + remainder.reverse
	end

end

p middle_permutation('abcdxg')