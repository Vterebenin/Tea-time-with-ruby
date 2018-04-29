=begin
For building the encrypted string:
Take every 2nd char from the string, then the other chars, that are not every 2nd char, and concat them as new String.
Do this n times!
=end

# My methods
def encrypt(text, n)
	text = text.split('')
	n.times do 
		b = []
		c = []
  	text = text.each.with_index(0) {|x,i| (i % 2) == 0 ? b.push(x) : c.push(x)  }
  	text = (c+b)
  end
  text.join
end

def decrypt(encrypted_text, n)

	encrypted_text = encrypted_text.split('')
	n.times do 
		b = []
		c = []
  	encrypted_text = encrypted_text.each.with_index(1) {|x,i| i > encrypted_text.length/2 ? b.push(x) : c.push(x)  }
  	encrypted_text = []
  	i = 0
  	while i <= b.length && i <= c.length
  		encrypted_text.push(b[i])
  		encrypted_text.push(c[i])
  		i += 1
  	end
  	encrypted_text.compact!
  end
  encrypted_text.join
end
p encrypt("This is a test!", 2)
p decrypt("hsi  etTi sats!", 1)
p decrypt("s eT ashi tist!", 2)

# BP 
def encrypt(text, n)
  return text if n <= 0
  text.scan(/(.)(.)?/). 	# [["T", "h"], ["i", "s"], [" ", "i"], ["s", " "], ["a", " "], ["t", "e"], ["s", "t"], ["!", nil]]
  			transpose.				# [["T", "i", " ", "s", "a", "t", "s", "!"], ["h", "s", "i", " ", " ", "e", "t", nil]]
  			reverse.					# [["h", "s", "i", " ", " ", "e", "t", nil], ["T", "i", " ", "s", "a", "t", "s", "!"]]
  			join
  encrypt(text.scan(/(.)(.)?/).transpose.reverse.join, n-1)
end

def decrypt(text, n)
  return text if n <= 0
  c, s = text.chars, text.size/2
  decrypt(c.drop(s).zip(c.take s).join, n-1)
end

p encrypt("This is a test!", 2)
p decrypt("hsi  etTi sats!", 1)
p decrypt("s eT ashi tist!", 2)
# since there are new methods for me i choose to take a explanation of them