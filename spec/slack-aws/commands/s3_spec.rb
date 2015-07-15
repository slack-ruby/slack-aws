require 'spec_helper'

describe SlackAws::Commands::S3 do
  def app
    SlackAws::App.new
  end
  it 'buckets', vcr: { cassette_name: 's3/list_buckets' } do
    expect(message: 'aws s3 buckets').to respond_with_slack_message([
      'name=*bucket1.example.net*, creation_date=*2015-01-07 22:37:45 UTC*',
      'name=*bucket2*, creation_date=*2014-01-29 14:54:38 UTC*'].join("\n"))
  end
  it 'ls', vcr: { cassette_name: 's3/list_objects' } do
    expect(message: 'aws s3 ls bucket1 5').to respond_with_slack_message([
      'key=*1.zip*, size=*21991757*, last_modified=*2013-10-17 21:30:13 UTC*',
      'key=*Cheffile.lock*, size=*1157*, last_modified=*2013-10-17 22:51:11 UTC*'
    ].join("\n"))
  end
end
