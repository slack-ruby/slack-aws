module SlackAws
  module Commands
    class Default < SlackRubyBot::Commands::Base
      def self.call(data, _command, _arguments)
        send_message_with_gif data.channel, SlackAws::ABOUT, 'cloud'
      end
    end
  end
end
