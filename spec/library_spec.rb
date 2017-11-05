require './lib/library'
require 'date'

describe Library do

  it 'has a collection of books on initialize' do
    expect(subject.books).to eq []
  end

  it 'should show available books' do
    expect(subject.books_available{ :item[:available] }).to be true
  end
end
