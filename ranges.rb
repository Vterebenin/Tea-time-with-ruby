
class VU

  include Comparable

  attr :volume

  def initialize(volume)  # 0..9
    @volume = volume
  end

  def inspect
    '#' * @volume
  end

  # Support for ranges

  def <=>(other)
    self.volume <=> other.volume
  end

  def succ
    raise(IndexError, "Volume too big") if @volume >= 9
    VU.new(@volume.succ)
  end
end

puts medium = VU.new(4)..VU.new(7)
puts medium.to_a
puts medium.include?(VU.new(3))


while gets
  print if /start/../end/
end