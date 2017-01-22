module SlackAws
  module Util
    module AwsClientResponse
      def send_fields(client, channel, data, *fields)
        message = data.map do |row|
          fields.map do |field|
            value = row.send(field)
            "#{field}=*#{value}*" if value
          end.compact.join(', ')
        end.join("\n")
        client.say(text: message, channel: channel)
      end
    end
  end
end
