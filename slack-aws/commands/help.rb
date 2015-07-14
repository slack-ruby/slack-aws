module SlackAws
  module Commands
    class Help < SlackRubyBot::Commands::Base
      def self.call(data, _command, _arguments)
        send_message_with_gif data.channel, 'See https://github.com/dblock/slack-aws, please.', 'help'
      end
    end
  end
end
