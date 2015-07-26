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
        send_message client, channel, message
      end
    end
  end
end
