RSpec.configure do |config|
  config.before do
    SlackRubyBot.config.user = 'aws'
    Aws.config[:region] = 'us-east-1'
  end
end
