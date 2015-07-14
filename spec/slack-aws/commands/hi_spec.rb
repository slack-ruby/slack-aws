require 'spec_helper'

describe SlackRubyBot::Commands::Hi do
  def app
    SlackAws::App.new
  end
  it 'says hi' do
    expect(message: 'aws hi').to respond_with_slack_message('Hi <@user>!')
  end
end
