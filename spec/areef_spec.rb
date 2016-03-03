require 'spec_helper'

describe 'Todolist App' do
  include Rack::Test::Methods

  TodoApplication = Todolist::Application.new

  def app
   require "todolist/config/routes.rb"
   TodoApplication
  end

  it "returns a list of all my todos" do
    get '/todo'
    expect(last_response).to be_ok
    expect(last_response.body).to include("['Write a book', 'Build a house', 'Get married', 'Buy a car']")
  end

  it "returns first item in my todolist" do
    get '/todo/5'
    expect(last_response).to be_ok
    expect(last_response.body).to include("Write a book")
  end

  it "can respond to post request" do
    post "/todo/10"
    expect(last_response).to be_ok
    expect(last_response.body).to include("Write a book")
  end

  it "can respond to put request" do
    put "/todo/20"
    expect(last_response).to be_ok
    expect(last_response.body).to include("Write a book")
  end

  it "can respond to delete request" do
    delete "/todo/2"
    expect(last_response).to be_ok
    expect(last_response.body).to include("Write a book")
  end
end
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
