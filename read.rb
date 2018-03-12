require "./lib/app"

#open file passed in the command line 
input = ARGV.first

#create new app 
app = App.new(input)


#error checking
if app 
	print "File Read Successfully\n" 
end

#Run the main method
callback = app.read_input

#Error checking
if callback 
	print "Output Written as report.txt in this folder\n"
else
	print "Sorry! Some error happended! Please check the input file again\n"
end