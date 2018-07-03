require 'hashie'
p icecream = Hashie::Mash.new
p icecream.flavor = "strawberry"
p icecream.flavor # => "strawberry"