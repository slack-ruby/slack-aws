RSpec.configure do |config|
  config.before do
    Aws.config[:region] = ENV['AWS_REGION'] || 'us-east-1'
    Aws.config[:access_key_id] = ENV['AWS_ACCESS_KEY_ID'] || 'access_key_id'
    Aws.config[:secret_access_key] = ENV['AWS_SECRET_ACCESS_KEY'] || 'secret_access_key'
  end
end
