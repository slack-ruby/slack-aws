require 'spec_helper'

describe SlackAws::App do
  def app
    SlackAws::App.new
  end
  context 'authed' do
    it_behaves_like 'a slack ruby bot'
  end
end
