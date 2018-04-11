
require 'net/http'

pages = %w( www.vk.com
www.awl.com
www.pragmaticprogrammer.com
)

threads = []

for page in pages
	threads << Thread.new(page) { |myPage|

		h = Net::HTTP.new(myPage, 80)
		puts "Fetching: #{myPage}"
		resp, data = h.get('/', nil )
		puts "Got #{myPage}:  #{resp.message}"
	}
end

threads.each { |aThread|  aThread.join }

count = 0
threads = []
10.times do |i|
	threads[i] = Thread.new do
		sleep(rand(0.1))
		Thread.current["mycount"] = count
		count += 1
	end
end
threads.each { |t| t.join; print t["mycount"], ", " }

