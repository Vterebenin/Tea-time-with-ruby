#THIS FILE GIVE YOU UNDERSTANDING ABOUT REGULAR EXPRESSION
#TRY TO FIGURE OUT WHATS HAPPENING. IT IS SO IMPORTANT!!
def showRE(a,re)
	if a =~ re
		"#{$&}"
	else
		"no match"
	end
end

puts showRE("very interesting shit", /t/) # very in<<t>>eresting shit
puts showRE("Fats Waller", /Waller/) # Fats <<Waller>>
puts showRE("kangaroo", /angar/) # k<<angar>>oo
puts showRE("!@%&-_=+", /%&/) # !@<<%&>>-_=+
puts showRE('yes | no', /\|/)	# yes <<|>> no
puts showRE('yes (no)', /\(no\)/) # yes <<(no)>>
puts showRE('are you sure?', /e\?/) # are you sur<<e?>>
puts showRE("this is\nthe time", /^the/)	#	this is\n<<the>> time. Вот эта херня ищет с начала ^(ставим вначале)
puts showRE("this is\nthe time", /is$/)	#	this <<is>>\nthe time. Ну а вот эта с конца $(ставим в конце)
puts showRE("this is\nthe time", /\Athis/)	#	<<this>> is\nthe time. Эта тоже сначала
puts showRE("this is\nthe time", /\Athe/)	#	no match. (ну а тут совпадений нет, пушо не переходит на некст строчку)

puts showRE("this is\nthe time", /\bis/)	#	this <<is>>\nthe time (тут ищет именно слова)
puts showRE("this is\nthe time", /\Bis/)	#	th<<is>> is\nthe time (а тут ищет именно необходимое значение)

puts showRE('It costs $12.', /[aeiou]/) # It c<<o>>sts $12. (находим гласные)
puts showRE('It costs $12.', /[\s]/) # It<< >>costs $12. (находим спейс)

a = 'Gamma [Design Patterns-page 123]'
puts showRE(a, /[]]/)		# => Gamma [Design Patterns-page 123<<]>>
puts showRE(a, /[B-F]/)	# => Gamma [<<D>>esign Patterns-page 123]
puts showRE(a, /[-]/)		# => Gamma [Design Patterns<<->>page 123]
puts showRE(a, /[0-9]/)	# => Gamma [Design Patterns-page <<1>>23]
#Character class abbreviations
#Sequence	As [ ... ]	Meaning
#\d	[0-9]	Digit character
#\D	[^0-9]	Nondigit
#\s	[\s\t\r\n\f]	Whitespace character
#\S	[^\s\t\r\n\f]	Nonwhitespace character
#\w	[A-Za-z0-9_]	Word character
#\W	[^A-Za-z0-9_]	Nonword character

a = 'It costs $12.'
puts showRE(a, /c.s/)	# It <<cos>>ts $12.
puts showRE(a, /./)		#	<<I>>t costs $12.
puts showRE(a, /\./)		#	It costs $12<<.>>

#r *	matches zero or more occurrences of r.
#r +	matches one or more occurrences of r.
#r ?	matches zero or one occurrence of r.
#r {m,n}	matches at least ``m'' and at most ``n'' occurrences of r.
#r {m,}	matches at least ``m'' occurrences of r.


a = "The moon is made of cheese"
puts showRE(a, /\w+/)	#	<<The>> moon is made of cheese
puts showRE(a, /\s.*\s/)	#	The<< moon is made of >>cheese
puts showRE(a, /\s.*?\s/)	#	The<< moon >>is made of cheese
puts showRE(a, /[aeiou]{2,99}/)	#	The m<<oo>>n is made of cheese
puts showRE(a, /mo?o/)	#	The <<moo>>n is made of cheese


a = "red ball blue sky"
puts showRE(a, /d|e/)	#	r<<e>>d ball blue sky
puts showRE(a, /al|lu/)	#	red b<<al>>l blue sky
puts showRE(a, /red ball|angry sky/)	#	<<red ball>> blue sky

puts showRE('banana', /an*/)	#	b<<an>>ana
puts showRE('banana', /(an)*/)	#	<<>>banana
puts showRE('banana', /(an)+/)	#	b<<anan>>a
a = 'red ball blue sky'
puts showRE(a, /blue|red/)	#	<<red>> ball blue sky
puts showRE(a, /(blue|red) \w+/)	#	<<red ball>> blue sky
puts showRE(a, /(red|blue) \w+/)	#	<<red ball>> blue sky
puts showRE(a, /red|blue \w+/)	#	<<red>> ball blue sky
puts showRE(a, /red (ball|angry) sky/)	#	no match
a = 'the red angry sky'
puts showRE(a, /red (ball|angry) sky/)	#	the <<red angry sky>>

"12:50am" =~ /(\d\d):(\d\d)(..)/	#	0
"Hour is #$1, minute #$2"	#	"Hour is 12, minute 50"
"12:50am" =~ /((\d\d):(\d\d))(..)/	#	0
"Time is #$1"	#	"Time is 12:50"
"Hour is #$2, minute #$3"	#	"Hour is 12, minute 50"
"AM/PM is #$4"	#	"AM/PM is am"


# match duplicated letter
puts showRE('He said "Hello"', /(\w)\1/)	#	He said "He<<ll>>o"
# match duplicated substrings
puts showRE('Mississippi', /(\w+)\1/)	#	M<<ississ>>ippi


puts showRE('He said "Hello"', /(["']).*?\1/)	#	He said <<"Hello">>
puts showRE("He said 'Hello'", /(["']).*?\1/)	#	He said <<'Hello'>>


a = "the quick brown fox"
puts a.sub(/[aeiou]/,  '*')	#	"th* quick brown fox"
puts a.gsub(/[aeiou]/, '*')	#	"th* q**ck br*wn f*x"
puts a.sub(/\s\S+/,  '')	#	"the brown fox"
puts a.gsub(/\s\S+/, '')	#	"the"


a = "the quick brown fox"
puts a.sub(/^./) { $&.upcase }	#	"The quick brown fox"
puts a.gsub(/[aeiou]/) { $&.upcase }	#	"thE qUIck brOwn fOx"


def mixedCase(aName)
  aName.gsub(/\b\w/) { $&.upcase }
end
puts mixedCase("fats waller")	#	"Fats Waller"
puts mixedCase("louis armstrong")	#	"Louis Armstrong"
puts mixedCase("strength in numbers")	#	"Strength In Numbers"

puts "fred:smith".sub(/(\w+):(\w+)/, '\2, \1')	#	"smith, fred"
puts "nercpyitno".gsub(/(.)(.)/, '\2\1')	#	"encryption"


puts str = 'a\b\c'	#	"a\b\c"
puts str.gsub(/\\/, '\\\\\\\\')	#	"a\\b\\c"

def unescapeHTML(string)
  str = string.dup
  str.gsub!(/&(.*?);/n) {
    match = $1.dup
    case match
    when /\Aamp\z/ni           then '&'
    when /\Aquot\z/ni          then '"'
    when /\Agt\z/ni            then '>'
    when /\Alt\z/ni            then '<'
    when /\A#(\d+)\z/n         then Integer($1).chr
    when /\A#x([0-9a-f]+)\z/ni then $1.hex.chr
    end
  }
  str
end

puts unescapeHTML("1&lt;2 &amp;&amp; 4&gt;3") # 1<2 && 4>3
puts unescapeHTML("&quot;A&quot; = &#65; = &#x41;") # "A" = A = A


re = /(\d+):(\d+)/     # match a time hh:mm
md = re.match("Time: 12:34am")
md.type	»	MatchData
md[0]         # == $&	»	"12:34"
md[1]         # == $1	»	"12"
md[2]         # == $2	»	"34"
md.pre_match  # == $`	»	"Time: "
md.post_match # == $'	»	"am"


re = /(\d+):(\d+)/     # match a time hh:mm
md1 = re.match("Time: 12:34am")
md2 = re.match("Time: 10:30pm")
md1[1, 2]	#	["12", "34"]
md2[1, 2]	#	["10", "30"]


re = /(\d+):(\d+)/
md1 = re.match("Time: 12:34am")
md2 = re.match("Time: 10:30pm")
[ $1, $2 ]   # last successful match	»	["10", "30"]
$~ = md1
[ $1, $2 ]   # previous successful match	»	["12", "34"]