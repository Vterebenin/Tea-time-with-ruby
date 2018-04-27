=begin
each_cons(p1) public
Iterates the given block for each array of consecutive <n> elements. 
If no block is given, returns an enumerator. 
p. s. i give up on this one. 
=end
def longest_consec(strarr, k)
  return "" unless k.between?(1, strarr.length)
  strarr.each_cons(k).map(&:join).max_by(&:length) || ""
end
p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 2)
