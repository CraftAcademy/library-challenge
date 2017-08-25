require './lib/library.rb'
require 'pry'

describe Library do
  it 'should have a collection of books' do
    expect(subject.collection).to be_an_instance_of(Array)
  end

  it 'should make a list of books that are available/unavailable' do
    expect(subject.list_books).to be_truthy
  end

  it 'should be able to change the status of a book to unavailable' do
    index = 1
    subject.collection[0][:available] = true
    subject.change_status(index)
    expect(subject.collection[index][:available]).to eq false
  end
end
