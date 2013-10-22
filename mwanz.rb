# Call this to execute!
require "yaml"
require "bot"

# Load config file ...
config = YAML::load(File.open('account.yml'))

  #trap "INT" do
  #  STDERR.puts "ctrl+c caught!"
  #  Thread.main.kill
  #end

begin
  # ... and run!
  bot = Bot.new config
  bot.run
  
  # Thread handling
  while true
    sleep 0.1
  end
rescue SignalException => e
  puts "Exiting ChatBot..."
  bot.stop
  puts "Goodbye."
  
end
