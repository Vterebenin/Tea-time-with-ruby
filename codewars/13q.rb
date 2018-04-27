def delete_nth(order,max_e)
  h = Hash.new(0)
  order.select { |e| p max_e >= h[e] += 1 }
end

p delete_nth([20,37,20,21], 1)
p delete_nth([1,1,3,3,7,2,2,2,2], 3)
p delete_nth([21, 41, 41, 21, 30, 21, 41, 30, 14, 21, 30, 14, 41, 14, 14, 30, 21, 14, 30, 14, 21, 41, 21, 21, 21, 41, 30, 14, 21, 14, 30, 30, 14, 14],5)