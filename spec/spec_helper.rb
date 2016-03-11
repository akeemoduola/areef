require "coveralls"
Coveralls.wear!

require "simplecov"
SimpleCov.start

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'rspec'
require 'rack/test'
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift File.expand_path('./todolist', __FILE__)
require 'areef'

class Post < Areef::AreefRecord
  to_table :posts
  property :id, type: :integer, primary_key: true
  property :title, type: :text, nullable: false
  property :body, type: :text, nullable: false
  property :created_at, type: :text, nullable: false
  create_table
end

def create_posts
  @post = Post.new
  @post.title = "Title to post"
  @post.body = "list body"
  @post.created_at = Time.now.to_s
  @post.save
end

def create_second_posts
  @post = Post.new
  @post.title = "Title to second post"
  @post.body = "Second Post body"
  @post.created_at = Time.now.to_s
  @post.save
end

module Areef
  class AreefRecord
    attr_reader :title, :body, :created_at, :id
    @id = 1
    @title = "Title to second post"
    @body = "Second Post body"
    @created_at = Time.now.to_s
  end
end
