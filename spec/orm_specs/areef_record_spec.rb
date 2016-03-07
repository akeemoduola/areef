
require "spec_helper"
describe Areef::AreefRecord do
  let(:areef_record) { Areef::AreefRecord }
  let(:areef) { Areef::AreefRecord.new }

  before(:each) do
    Post.delete_all
  end
  after(:each) do
    Post.delete_all
  end

  it "returns primary key query as string" do
    primary = "PRIMARY KEY AUTOINCREMENT"
    expect(areef_record.primary_key_query(true)).to eq primary
  end

  it "returns autoincrement query as string" do
    auto = "AUTOINCREMENT"
    expect(areef_record.autoincrement_query(true)).to eq auto
  end

  it "returns nullable query as string" do
    notnull = "NOT NULL"
    expect(areef_record.nullable_query(false)).to eq notnull
  end

  it "returns type query as string" do
    expect(areef_record.type_query(:text)).to eq "text"
  end

  it "instantiates table name" do
    create_posts
    expect(Post.to_table("posts")).to eq "posts"
  end

  it "returns a hash of properties" do
    create_posts
    expect(Post.property(:id, type: :integer)).to eql(type: :integer)
  end

  it "returns symbols of properties keys" do
    create_posts
    expect(Post.make_methods).to eq [:id, :title, :body, :created_at]
  end

  it "returns symbols of properties keys" do
    create_posts
    expect(Post.map_object(Post.first).title).to include "Title to post"
  end

  it "crates a table" do
    expect(Post.create_table).to eq [:id, :title, :body, :created_at]
  end

  it "returns properties keys" do
    expect(Post.properties_keys).to eq [:id, :title, :body, :created_at]
  end

  it "returns update records placeholders" do
    keys = [:id, :title, :body, :created_at]
    result = "title=?,body=?,created_at=?"
    allow(areef_record).to receive(:properties_keys).and_return keys
    expect(areef.update_records_placeholders).to eq result
  end

  it "returns new records placeholders" do
    keys = [:id, :title, :body, :created_at]
    result = "?,?,?"
    allow(areef_record).to receive(:properties_keys).and_return keys
    expect(areef.new_record_placeholders).to eq result
  end
end
