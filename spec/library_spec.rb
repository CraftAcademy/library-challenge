require './lib/library'
require 'date'

describe Library do

  it 'has a collection of books on initialize' do
    expect(subject.books).to eq []
  end
end
