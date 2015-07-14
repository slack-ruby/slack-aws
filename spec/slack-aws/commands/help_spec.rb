require 'spec_helper'

describe SlackAws::Commands::Help do
  def app
    SlackAws::App.new
  end
  it 'help' do
    expect(message: 'aws help').to respond_with_slack_message('See https://github.com/dblock/slack-aws, please.')
  end
end
