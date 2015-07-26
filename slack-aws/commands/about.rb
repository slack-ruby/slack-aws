module SlackAws
  module Commands
    class Default < SlackRubyBot::Commands::Base
      match(/^(?<bot>\w*)$/)

      def self.call(client, data, _match)
        send_message_with_gif client, data.channel, SlackAws::ABOUT, 'cloud'
      end
    end
  end
end
