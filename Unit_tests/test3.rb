require 'test/unit'
class TestsWhichFail < Test::Unit::TestCase
	def test_reading
		assert_not_nil(ARGF.read, "Read next line of input")
	end
end