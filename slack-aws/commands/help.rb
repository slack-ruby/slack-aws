module SlackAws
  module Commands
    class Help < SlackRubyBot::Commands::Base
      command 'help' do |data, _match|
        send_message_with_gif data.channel, 'See https://github.com/dblock/slack-aws, please.', 'help'
      end
    end
  end
end
