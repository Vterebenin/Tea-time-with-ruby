$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require './roman'
require 'test/unit'
# class TestRoman < Test::Unit::TestCase
# 	def test_simple
# 		assert_equal("i", 	Roman.new(1).to_s)		# Ассерты просто проверяют соответствуют ли значения, 
# 		assert_equal("ii", 	Roman.new(2).to_s)		# необходимым значениям
# 		assert_equal("iii",	Roman.new(3).to_s)		# 
# 		assert_equal("iv", 	Roman.new(4).to_s)		#
# 		assert_equal("ix", 	Roman.new(9).to_s)		#
# 	end
# end
# Код переписан и выглядит теперь вот так:
class TestRoman < Test::Unit::TestCase
	NUMBERS = [
		[ 1, "i" ], [ 2, "ii" ], [ 3, "iii" ],
		[ 4, "iv"], [ 5, "v" ], [ 9, "ix" ],
		[7, "vii"]
	]
	# Assert-тесты
	def test_simple
		NUMBERS.each do |arabic, roman|
			r = Roman.new(arabic)
			assert_equal(roman, r.to_s)
		end
	end
	# Raised-тесты
	def test_range
		assert_raise(RuntimeError) { Roman.new(0) }
		assert_nothing_raised() { Roman.new(1) }
		assert_nothing_raised() { Roman.new(499) }
		assert_raise(RuntimeError) { Roman.new(5000) }
	end
	# аннотация к not_nil-тесту
	
end