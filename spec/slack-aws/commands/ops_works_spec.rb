require 'spec_helper'

describe SlackAws::Commands::OpsWorks do
  def app
    SlackAws::App.new
  end
  it 'stacks', vcr: { cassette_name: 'ops_works/describe_stacks' } do
    expect(message: 'aws opsworks stacks').to respond_with_slack_message([
      'name=*example-staging*, created_at=*2013-02-25T18:00:58+00:00*',
      'name=*example-production*, created_at=*2013-05-17T15:13:10+00:00*'
    ].join("\n"))
  end
  it 'apps', vcr: { cassette_name: 'ops_works/describe_apps' } do
    expect(message: 'aws opsworks apps example-production').to respond_with_slack_message([
      'shortname=*example*, name=*example*, created_at=*2013-05-17T15:13:10+00:00*'
    ].join("\n"))
  end
  it 'instances', vcr: { cassette_name: 'ops_works/describe_instances' } do
    expect(message: 'aws opsworks instances example-production').to respond_with_slack_message([
      'hostname=*rails-app1*, instance_type=*m3.large*, status=*online*, public_dns=*ec2-32-161-139-31.compute-1.amazonaws.com*, created_at=*2013-05-17T15:37:25+00:00*',
      'hostname=*rails-app2*, instance_type=*m3.large*, status=*online*, public_dns=*ec2-32-145-242-22.compute-1.amazonaws.com*, created_at=*2013-05-17T15:37:56+00:00*'
    ].join("\n"))
  end
end
