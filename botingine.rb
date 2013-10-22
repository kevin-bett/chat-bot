# Main Bot Class!
require 'rubygems'
require 'xmpp4r'

class Bot
  attr_writer :config
  
  @cnx = nil
  
  # Initializes!
  def initialize(configuration)
    @config = configuration
  end
  
  def run
    puts "Connecting to server.."
    @cnx = Jabber::Client.new Jabber::JID::new("#{@config['user']['username']}@#{@config['server']['url']}")
    @cnx.connect
    puts "Logging in..."
    @cnx.auth @config['user']['password']
    @cnx.send Jabber::Presence.new.set_type(:available)
    puts "Connected!"
    @cnx.add_message_callback do |message|
      begin
        handle_message(message)
      rescue SignalException => e
        raise e
      rescue Exception => e
        puts "Error handling message: "
        puts e.message
      end
    end
  end
  
  def stop
    @cnx.close
  end
  
  def handle_message(m)
    return if m.body.nil? or m.body.empty?  
    puts "Message recieved from #{m.from}: #{m.body}"
    puts "\tState: #{m.chat_state.to_s}"
    msg = Jabber::Message::new(m.from, "You said '" + m.body + "'")
    msg.type = :chat
    @cnx.send msg 
  end
  
end
