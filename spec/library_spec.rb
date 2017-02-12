require 'yaml'
require './lib/library.rb'

describe Library do
  it 'should have the list of books' do
    expect(subject.bookrack).not_to be nil
  end

  it 'should check if the book is available' do
     expect(subject.bookrack[0][:available]).to be true
  end

  it 'should check if the book is not available' do
     expect(subject.bookrack[2][:available]).to be false
  end


end
