module SlackAws
  module Commands
    class Help < SlackRubyBot::Commands::Base
      command 'help' do |client, data, _match|
        client.say(text: 'See https://github.com/dblock/slack-aws, please.', channel: data.channel)
      end
    end
  end
end
