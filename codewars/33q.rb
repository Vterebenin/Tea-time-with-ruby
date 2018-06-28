def find_it(seq)
  seq.group_by{|x|x}.map{|x,y|[x,y.size]}.select {|e| e[1].odd? }[0][0]
  # bp seq.detect { |n| seq.count(n).odd? }
end

p find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5])