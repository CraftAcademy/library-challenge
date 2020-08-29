require './lib/library'
require 'pry'

describe Library do
  it 'there is a collection with books in it' do
    expect(subject.collection).to be_truthy
  end

  it 'when searching for author we get all the books for that author' do
    expect(subject.search_by_author("As")).to eq search_result
  end
end