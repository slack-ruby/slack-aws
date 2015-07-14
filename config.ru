$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'slack-aws'
require 'web'

Thread.new do
  begin
    SlackAws::App.instance.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run SlackAws::Web
