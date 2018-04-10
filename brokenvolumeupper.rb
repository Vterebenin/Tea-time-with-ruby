class BrokenAmplifier
	attr_accessor :left_channel, :right_channel
	def volume=(vol)
		left_channel = self.right_channel = volume
	end
end

ba = BrokenAmplifier.new
ba.left_channel = ba.right_channel = 99
ba.volume = 5
puts ba.left_channel
puts ba.right_channel

# We forgot to put "self." in front of the assignment to left_channel, so Ruby stored the new value in
# a local variable of method volume=;
# the object attribute never got updated. 
# Tricky bug to track down by the way haHAa

