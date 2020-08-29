require './lib/library'
require 'pry'

describe Library do
  it 'there is a collection with books in it' do
    expect(subject.set_collection).to be_truthy
  end
end