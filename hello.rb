 def callBlock
    yield , 
  end

  callBlock { pust "nu i" |, | puts "govno" }