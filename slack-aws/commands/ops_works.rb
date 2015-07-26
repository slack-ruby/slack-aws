module SlackAws
  module Commands
    class OpsWorks < SlackRubyBot::Commands::Base
      extend SlackAws::Util::AwsClientResponse

      command 'opsworks' do |client, data, match|
        arguments = match['expression'].split.reject(&:blank?) if match.names.include?('expression')
        case arguments && arguments.shift
        when 'stacks' then
          send_fields client, data.channel, Aws::OpsWorks::Client.new.describe_stacks.stacks, *[:name, :created_at].concat(arguments)
        when 'apps' then
          opsworks_client = Aws::OpsWorks::Client.new
          stacks = Hash[opsworks_client.describe_stacks.stacks.map { |stack| [stack.name, stack.stack_id] }]
          stack_name = arguments.shift
          fail 'Syntax: aws opsworks apps [stack]' unless stack_name
          stack_id = stacks[stack_name]
          fail "Invalid stack: #{stack_name}" unless stack_id
          send_fields client, data.channel, opsworks_client.describe_apps(stack_id: stack_id).apps, *[:shortname, :name, :description, :created_at].concat(arguments)
        when 'instances' then
          opsworks_client = Aws::OpsWorks::Client.new
          stacks = Hash[opsworks_client.describe_stacks.stacks.map { |stack| [stack.name, stack.stack_id] }]
          stack_name = arguments.shift
          fail 'Syntax: aws opsworks apps [stack]' unless stack_name
          stack_id = stacks[stack_name]
          fail "Invalid stack: #{stack_name}" unless stack_id
          send_fields client, data.channel, opsworks_client.describe_instances(stack_id: stack_id).instances, *[:hostname, :instance_type, :status, :public_dns, :created_at].concat(arguments)
        else
          send_message_with_gif client, data.channel, 'Syntax: aws opsworks [command], need `aws help`?', 'idiot'
        end
      end
    end
  end
end
