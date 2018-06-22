# Regular expression that matches binary inputs that are multiple of 3
multipleOf3Regex = /^((((0+)?1)(10*1)*0)(0(10*1)*0|1)*(0(10*1)*(1(0+)?))|(((0+)?1)(10*1)*(1(0+)?)|(0(0+)?)))$/
puts multipleOf3Regex =~ "000"

#BP 
multipleOf3Regex = /^(0|1(01*0)*1)*$/
puts multipleOf3Regex =~ "000"