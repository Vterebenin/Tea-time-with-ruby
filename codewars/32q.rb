def lcs(string1, string2)
  if string1.chars.none? { |x| string2.include?(x)}
    return ""
  elsif string1[-1] == string2[-1]
    return lcs(string1[0..-2], string2[0..-2]) + string1[-1]
  else
    x = lcs(string1, string2[0..-2])
    y = lcs(string1[0..-2], string2)
    x.length > y.length ? x : y
  end
end