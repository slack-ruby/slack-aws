require 'spec_helper'

describe SlackAws::Commands::S3 do
  def app
    SlackAws::App.new
  end
  it 'list buckets', vcr: { cassette_name: 's3/list_buckets' } do
    expect(message: 'aws s3 list buckets').to respond_with_slack_message(['bucket1.artsy.net', 'bucket2'].join("\n"))
  end
  it 'buckets', vcr: { cassette_name: 's3/list_buckets' } do
    expect(message: 'aws s3 buckets').to respond_with_slack_message(['bucket1.artsy.net', 'bucket2'].join("\n"))
  end
  it 'ls', vcr: { cassette_name: 's3/list_objects' } do
    expect(message: 'aws s3 ls bucket1').to respond_with_slack_message([
      ['1.zip', '21991757', '2013-10-17 21:30:13 UTC'].join("\t"),
      ['Cheffile.lock', '1157', '2013-10-17 22:51:11 UTC'].join("\t")
    ].join("\n"))
  end
end
