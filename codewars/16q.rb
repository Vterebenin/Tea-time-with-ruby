def valid_parentheses(string)
  if string.length <= 100 && string.length >= 0
  	string = string.split('')
  	s = Array.new
  	string.each {|elem| s.push(elem) if elem.match(/\(/) || elem.match(/\)/) }
  	if s.length > 1
  		one_array = []
  		i = 0
  		if s.first == ')'
  			false
  		else
  			while i <= s.length-1
  				one_array.append(s[i]) if s[i] == "("
          if s[i] == ")" && one_array.empty?
            one_array.append("fuck")
            break
          end
  				one_array.delete_at(one_array.length-1) if s[i] == ")" && !one_array.empty?
  				i += 1
  			end
        one_array.empty? 
  		end
  	elsif s.length == 1
  		false
  	elsif s.empty?
  		true
  	else
  		false
  	end
  else
  	false
  end
end

# best practices
# AHAHAHAH WHAT THE FUCK MAN

def valid_parentheses(string)
  open = 0
  string.chars.each do |c|
    open += 1 if c == "("
    open -= 1 if c == ")"
    return false if open < 0
  end
  open == 0
end
