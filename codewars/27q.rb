def buddy(start, nd)
  answer = ""
  (start..nd).each_with_index do |e, i|
  	p "m " + (m = e).to_s
  	p summ_of_m = (1..Math.sqrt(m)).select { |n| m % n == 0}.sum

  	if !(summ_of_m == 0)
  		p summ_of_m = (m / summ_of_m)
  		p "n " + (n = summ_of_m - 1).to_s
  		p summ_of_n = (1..Math.sqrt(n)).select { |m| n % m == 0}.sum
  		summ_of_n = (n / summ_of_n) if !(summ_of_n == 0)
  		if (summ_of_m == n + 1) && (summ_of_n == m + 1)
  			return p answer = "(#{m} #{n})"
  			break
  		end
  	end
  end
  p "Nothing" if answer.nil?
end
p buddy(48, 50)
# p buddy(1071625, 1103735)
 #p Math.sqrt(1071642).round