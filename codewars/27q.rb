def div_sum(n)
  sum_of_n = 1
  (2..Math.sqrt(n)).each do |i|
    sum_of_n += n/i + i if n % i == 0
  end
  sum_of_n
end

def buddy(start, nd)
  (start..nd).each do |e|
    m = e
    sum_of_m = div_sum(m)
    if !(sum_of_m == 0)
      "n " + (n = sum_of_m - 1).to_s
      sum_of_n = div_sum(n)
      if (sum_of_m == n + 1) && (sum_of_n == m + 1)
        return "(#{m} #{n})" if  m < n
      end
    end
  end
  "Nothing"
end


p buddy(48, 50)
p buddy(1071625, 1103735)
 #p Math.sqrt(1071642).round
