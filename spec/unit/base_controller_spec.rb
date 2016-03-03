require "spec_helper"

describe Areef::BaseController do
  include Rack::Test::Methods
  describe "#initialize" do
    it "Takes exactly one argument" do
      expect{ Areef::BaseController.new }.to raise_error ArgumentError
      expect{ Areef::BaseController.new("hello", "world") }.to raise_error ArgumentError
    end

    it "Returns a new instance of Areef BaseController" do
      expect(Areef::BaseController.new("")).to be_an_instance_of Areef::BaseController
    end
  end

  describe "#response" do
    it "Returns a new instance of Rack Response" do
      expect(Areef::BaseController.new(ENV).response("")).to be_an_instance_of Rack::Response
    end
  end

  describe "#get_response" do
    context "When response hasn't been initialized" do
      it "Returns nil" do
        expect(Areef::BaseController.new(ENV).get_response).to be nil
      end
    end

    context "When response has been initialized" do
      it "Returns a new instance of Rack Response" do
        base_controller = Areef::BaseController.new(ENV)
        base_controller.response("")
        expect(base_controller.get_response).to be_an_instance_of Rack::Response
      end
    end
  end

  describe "#render" do
    it "Returns a new instance of Rack Response" do
      class Tilt::ErubisTemplate
        def initialize(arg)
          ""
        end

        def render &block
          ""
        end
      end
      allow(Object).to receive(:const_missing).and_return("")
      expect(Areef::BaseController.new(ENV).render("")).to be_an_instance_of Rack::Response
    end
  end

  describe "#redirect_to" do
    it "Returns a new instance of Rack Response" do
      expect(Areef::BaseController.new(ENV).redirect_to("/")).to be_an_instance_of Rack::Response
    end
  end

  describe "#render_template" do
    it "Calls Tilt ErubisTemplate and returns a result" do
      class Tilt::ErubisTemplate
        def initialize(arg)
          ""
        end

        def render &block
          ""
        end
      end
      allow(Object).to receive(:const_missing).and_return("")
      expect(Areef::BaseController.new(ENV).render_template("body")).to eql("")
    end
  end

  describe "#controller" do
    it "Should be a private method" do
      expect{ Areef::BaseController.new(ENV).controller_name }.to raise_error NoMethodError
    end

    it "Converts a camel cased string to snake case
        and replaces all instances of the word 'Controller'
        with an empty string" do
      class MySpecController < Areef::BaseController; end
      expect(MySpecController.new(ENV).send(:controller)).to eql("my_spec")
    end
  end
end
