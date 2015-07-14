require 'spec_helper'

describe SlackAws::App do
  def app
    SlackAws::App.new
  end
  it_behaves_like 'a slack ruby bot'
end
