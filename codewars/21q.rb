def snail(array)
  array.empty? ? [] : array.shift + snail(array.transpose.reverse)
end

p snail([[1,2,3],[4,5,6],[7,8,9]])