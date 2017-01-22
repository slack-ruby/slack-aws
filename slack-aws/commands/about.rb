module SlackAws
  module Commands
    class Default < SlackRubyBot::Commands::Base
      match(/^(?<bot>\w*)$/)

      def self.call(client, data, _match)
        client.say(text: SlackAws::ABOUT, channel: data.channel)
      end
    end
  end
end
