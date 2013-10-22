class Robot
	def name
		puts 'What is your name?'
		name = gets.chomp
	end
	def hello
		user_name = name
		puts "Hello, #{user_name.upcase}! "
		puts "how was your day?"
	end
	def options
		puts <<-eod
		1. great
		2. bad or just another day passed

		Please choose by number.
		eod
	end
	def reply
		number = gets.chomp.to_i
	end
	def ask_game
		puts "Would you like to play a game?  (yes / no)"
		response = gets.chomp
	end
	def invalid_entry method_name 
		puts "Invalid entry,Please select again.."
		method("#{method_name}").call	
	end
	def response
		number = reply
		if number == 1 
			puts "seems you are cheerfull today" 
			ask_game
		elsif number == 2
			puts " Really , i need to cheer you up.."
			ask_game
		else
			invalid_entry("response")
		end
	end
	def what_game
		puts <<-eod
		What game would you like to play that I know among these?:
		1. Chess
		2. scrabble
		3. Checkers
		Pick a game by number.
		eod

		number = gets.chomp.to_i
	end
	def after_response
		response_answer = response
		if response_answer =~ /yes/i
			what_game
		else
			puts "OK, goodbye."
		end
	end
	def game_selected
		number = after_response
		if number == 2
			puts  "seriously? That is way too is boring."

			puts " Anyway you keep enjoying your day.goodbye"


		elsif number == 1
			puts "Thats a challenging one but I'll try to keep up with you Champ."
			puts "for now let me get board and chess pieces"
			$stdout.sync = true
			3.times do 
				putc (".")
				sleep(1)
			end

			puts "i must have misplaced them Anyway, we'll get to play some other times,keep enjoying your day"
			puts "Goodbye"
		elsif number == 3
			puts "Thats a challenging but I'll try to keep up with you champ." 

			puts "for now let me get board and Checker pieces"
			$stdout.sync = true
			3.times do 
				putc (".")
				sleep(1)
			end
			puts "i must have misplaced them Anyway, we'll get to play some other times,keep enjoying your day"
			puts "Goodbye"
		elsif number > 3
			invalid_entry "game_selected"
		end

	end
end

robot = Robot.new
robot.hello
robot.options
robot.game_selected