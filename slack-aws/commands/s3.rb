module SlackAws
  module Commands
    class S3 < SlackRubyBot::Commands::Base
      def self.call(data, _command, arguments)
        s3 = Aws::S3::Client.new
        s3_command = arguments.join(' ') if arguments
        if s3_command == 'list buckets' || s3_command == 'buckets'
          send_message data.channel, s3.list_buckets.buckets.map(&:name).join("\n")
        elsif arguments.first == 'ls'
          options = { max_keys: 5 }
          options[:bucket] = arguments[1] if arguments[1]
          message = s3.list_objects(options).contents.map do |object|
            [object.key, object.size, object.last_modified].join("\t")
          end.join("\n")
          send_message data.channel, message
        else
          send_message_with_gif data.channel, 'Syntax: aws s3 [command], need `aws help`?', 'idiot'
        end
      end
    end
  end
end
