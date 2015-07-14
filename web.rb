require 'sinatra/base'

module SlackAws
  class Web < Sinatra::Base
    get '/' do
      'Slack integration with AWS, https://github.com/dblock/slack-aws.'
    end
  end
end
