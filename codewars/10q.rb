# my one! looks cool
def duplicate_encode(word)
  word.downcase!.split('').map { |elem| word.count(elem) > 1 ? elem = ")" : elem = "(" }.join('')
end
p duplicate_encode("dinN")
# bp just change split('') to chars
def duplicate_encode(word)
  word.downcase.chars.map {|x| word.downcase.count(x) > 1 ? ")" : "("}.join("")
end