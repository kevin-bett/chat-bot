$stdout.sync = true

puts 'What is your name?'

name = gets.chomp
puts "Hello, #{name}! "
3.times do 
	putc (".")
	sleep(1)
end
puts "how was your day?"
#responce = gets.chomp  # get the responces limited to 1 or 2 for ease
puts <<-eod
1. great
2. bad or just another day passed

Please choose by number.
eod

number = gets.chomp.to_i

if number == 1 
	
	puts "seems you are cheerfull today, Would you like to play a game? (yes / no)"

	response = gets.chomp
	if response =~ /yes/i
		puts <<-eod
		What game would you like to play? I know:
		1. Chess
		2. scrabble
		3. Checkers
		Pick a game by number.
		eod

		number = gets.chomp.to_i

		if number == 2
			puts  "What !!! really ? are you serious, That game is boring."
		elsif number == 1
			puts "Thats a challenging but I'll try to keep up with you champ."
		elsif number == 3
			puts "Thats a challenging but I'll try to keep up with you champ." 
		end
	else
		puts "OK, goodbye."
	end
else
	puts "OK, goodbye."
end
