require "spec_helper"
require "capybara/rspec"
require "todolist/test_helper"

RSpec.configure do |config|
  config.before(:each) do
    Capybara.app = APP
    List.delete_all
    @list = List.new
    @list.title = "First Todo"
    @list.body = "First Todo Body"
    @list.done = "false"
    @list.created_at = Time.now.to_s
    @list.save
  end
  config.after(:each) do
    List.delete_all
  end
end
