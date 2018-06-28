def top_3_words(string)
  if !string.nil? || !string.empty?
    string = string.downcase.split
        .group_by{|x|x}
        .map{|x,y|[x,y.size]}.reverse
    string = string.sort_by{|_,size| size} # Have to sort =/
        .last(3)
        .reverse  
    string = string.map! { |e| e[0].strip.empty? ? e = nil : e[0] }
          .compact
          .map { |e| e.gsub(/[^0-9a-z']/i, '') }
    string.reject! { |s| s == "" || s == "'" }
    string
  else
    a = []
  end
end