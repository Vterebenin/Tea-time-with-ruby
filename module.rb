module Debug
	def whoAmI?
		"#{self.type.name} (\##{self.id}): #{self.to_s}"
	end
end

class Phonograph
	include Debug
	# ... do some shit
end

class EightTrack
	include Debug
	# ... do some another shit
end

ph = Phonograph.new("West End Blues")
et = EightTrack.new("Surrealistic Pillow")
puts ph.whoAmI? # "Phonograph (#537766170): West End Blues"
puts et.whoAmI? # "EightTrack (#537765860): Surrealistic Pillow"