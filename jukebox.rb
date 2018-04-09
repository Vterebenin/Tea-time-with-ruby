class SongList
	def initialize
		@songs = Array.new		
	end

	def append(aSong)
		@songs.push(aSong)
		self		
	end

	def deleteFirst
		@songs.shift		
	end

	def deleteLast
		@songs.pop
	end
end

list = SongList.new
list.
	append(Song.new('title1', 'artist1', 1)).
	append(Song.new('title2', 'artist2', 2)).
	append(Song.new('title3', 'artist3', 3)).
	append(Song.new('title4', 'artist4', 4))
