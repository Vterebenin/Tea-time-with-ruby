class Song
	attr_reader :name, :artist, :duration
	attr_writer :duration

	@@plays = 0

	def initialize(name, artist, duration)
		@name = name
		@artist = artist
		@duration = duration	
		@plays = 0
	end

	def play
		@plays += 1
		@@plays += 1
		"This song: #{@plays} plays. Total #{@@plays} plays"	
	end

	def durationInMinutes
		@duration/60.0		
	end

	def durationInMinutes=(value) # force floating point (wrong)
		@duration = (value*60).to_i 
	end	

	def to_s
		"Song: #{@name} -- #{@artist} (#{@duration})"
	end
end

class KaraokeSong < Song
	def initialize(name,artist,duration,lyrics)
		super(name, artist, duration)
		@lyrics = lyrics
	end

	def to_s
		super + " [#{@lyrics}]"
	end
end

class SongList

	MaxTime=5*60

	def SongList.isTooLong(aSong) # 
		return aSong.duration > MaxTime		
	end
end




class Shape
	def Shape.triangle(sideLength)
		Shape.new(3, sideLength*3)
	end
	def Shape.square(sideLength)
		Shape.new(4, sideLength*4)
	end
end

class Accounts
	private

	def debit(account,amount)
		account.balance -= amount			
	end
	def credit(account,amount)
		account.balance += amount			
	end

	public

	def transferToSaving(amount)
		debit(@checking, amount)
		credit(@savings, amount)
	end
end

class Account
	attr_reader :balance

	protected :balance

	def greaterBalanceThan(other)
		return @balance > other.balance		
	end
end

class SongList
	def initialize
		@songs = Array.new
		@index = WordIndex.new		
	end

	def [](key)
		return @songs[key] if key.kind_of?(Integer)
		return @songs.find {|aSong| aSong.name == key }
	end

	def append(aSong)
		@songs.push(aSong)
		@index.index(aSong, aSong.name, aSong.artist)
		self		
	end

	def lookup(aWord)
		@index.lookup(aWord)	
	end

	def deleteFirst
		@songs.shift		
	end

	def deleteLast
		@songs.pop
	end
end

class File
	def File.myOpen(*args)
		aFile = File.new(*args)
    # If there's a block, pass in the file and close
    # the file when it returns
    if block_given?
    	yield aFile
    	aFile.close
    	aFile = nil
    end
    return aFile
  end
end

class WordIndex
	def initialize
		@index = Hash.new(nil)
	end

	def index(anObject, *phrases)
		phrases.each do |aPhrase|
			aPhrase.scan /\w[-\w']+/ do |aWord| #extract each word
				aWord.downcase!
				@index[aWord] = [] if @index[aWord].nil?
				@index[aWord].push(anObject)
			end
		end
	end

	def lookup
		@index[aWord.downcase]
	end
end


class File
  def File.myOpen(*args) File
    aFile = File.new(*args)
    # If there's a block, pass in the file and close
    # the file when it returns
    if block_given?
      yield aFile
      aFile.close
      aFile = nil
    end
    return aFile
  end
end


list = SongList.new
list.
append(Song.new('title1', 'artist1', 1)).
append(Song.new('title2', 'artist2', 2)).
append(Song.new('title3', 'artist3', 3)).
append(Song.new('title4', 'artist4', 4))

puts list[3]

aSong = KaraokeSong.new("My Way", "Sinatra", 225, "And now, the...")

puts aSong.to_s
aSong = Song.new("Bicylops", "Fleck", 260)
puts aSong.to_s
puts aSong.artist
aSong.duration = 257
puts aSong.durationInMinutes
puts aSong.durationInMinutes = 4.2
puts aSong.duration

s1 = Song.new("Song1", "Artist1", 234) #test songs..
s2 = Song.new("Song2", "Artist2", 351)

puts s1.play
puts s2.play
puts s1.play
puts s2.play
File.open( "C:/webdevdev/workflow/ruby/123.txt", "r" )

puts SongList.isTooLong(s1)
puts SongList.isTooLong(s2)


songs = SongList.new
songFile.each do |line|
  file, length, name, title = line.chomp.split(/\s*\|\s*/)
  name.squeeze!(" ")
  mins, secs = length.scan(/\d+/)
  songs.append Song.new(title, name, mins.to_i*60+secs.to_i)
end
puts songs.lookup("Fats")
puts songs.lookup("ain't")
puts songs.lookup("RED")
puts songs.lookup("WoRlD")
