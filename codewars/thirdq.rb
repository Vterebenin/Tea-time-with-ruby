def getCount(inputStr)
	return inputStr.scan(/[aeiou]/).count
end


print getCount('ae sadfaf123yy')