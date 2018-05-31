require 'rubygems'
require 'engtagger'

# Create a parser object
tgr = EngTagger.new

# Sample text
text = "Alice chased the big fat cat."

# Add part-of-speech tags to text
tagged = tgr.add_tags(text)

#=> "<nnp>Alice</nnp> <vbd>chased</vbd> <det>the</det> <jj>big</jj> <jj>fat</jj><nn>cat</nn> <pp>.</pp>"

# Get a list of all nouns and noun phrases with occurrence counts
word_list = tgr.get_words(text)

#=> {"Alice"=>1, "cat"=>1, "fat cat"=>1, "big fat cat"=>1}

# Get a readable version of the tagged text
readable = tgr.get_readable(text)

#=> "Alice/NNP chased/VBD the/DET big/JJ fat/JJ cat/NN ./PP"

# Get all nouns from a tagged output
nouns = tgr.get_nouns(tagged)

#=> {"cat"=>1, "Alice"=>1}

# Get all proper nouns
proper = tgr.get_proper_nouns(tagged)

#=> {"Alice"=>1}

# Get all past tense verbs
pt_verbs = tgr.get_past_tense_verbs(tagged)

#=> {"chased"=>1}

# Get all the adjectives
adj = tgr.get_adjectives(tagged)

#=> {"big"=>1, "fat"=>1}

# Get all noun phrases of any syntactic level
# (same as word_list but take a tagged input)
nps = tgr.get_noun_phrases(tagged)

#=> {"Alice"=>1, "cat"=>1, "fat cat"=>1, "big fat cat"=>1}

def film_to_oleg(film)
	film = film.split(' ')
	n = ""
	hash = Hash[film.map.with_index.to_a]
	i = 0
	until (i >= film.count) || film.include?("Олег") do
		n = film.sample
		s = hash[n]
		n = "Олег" if n.length > 3
		film[s] = n
		i += 1
	end
	if film.include?("Олег")
		p film.join(" ")
	else
		p film.join(" ")
	end
end

# p 
film_to_oleg("У холмов есть глаза")
film_to_oleg("У нее")
film_to_oleg("У нее 123 ртов")