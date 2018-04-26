def is_isogram(string) 
  string.downcase.chars.uniq == string.downcase.chars
end

print is_isogram('aba')