require 'spec_helper'

describe Areef::Application do
  let(:app) { Areef::Application.new }
  before :each do
    allow_message_expectations_on_nil
  end

  it "responds to call" do
    expect(app.respond_to?(:call)).to be true
  end
end

describe Areef do
  it 'has a version number' do
    expect(Areef::VERSION).not_to be nil
  end
end
