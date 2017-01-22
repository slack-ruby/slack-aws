module SlackAws
  module Commands
    class S3 < SlackRubyBot::Commands::Base
      extend SlackAws::Util::AwsClientResponse

      command 's3' do |client, data, match|
        arguments = match['expression'].split.reject(&:blank?) if match.names.include?('expression')
        case arguments && arguments.shift
        when 'buckets' then
          send_fields client, data.channel, Aws::S3::Client.new.list_buckets.buckets, *[:name, :creation_date].concat(arguments)
        when 'ls' then
          options = {}
          options[:bucket] = arguments.shift
          options[:max_keys] = arguments.shift || 10
          send_fields client, data.channel, Aws::S3::Client.new.list_objects(options).contents, *[:key, :size, :last_modified].concat(arguments)
        else
          client.say(text: 'Syntax: aws s3 [command], need `aws help`?', channel: data.channel)
        end
      end
    end
  end
end
