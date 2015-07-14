require 'spec_helper'

describe SlackAws::Commands::Default do
  def app
    SlackAws::App.new
  end
  it 'aws' do
    expect(message: 'aws').to respond_with_slack_message(SlackAws::ABOUT)
  end
  it 'Aws' do
    expect(message: 'Aws').to respond_with_slack_message(SlackAws::ABOUT)
  end
end
