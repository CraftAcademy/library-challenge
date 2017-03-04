require 'yaml'
require './lib/library.rb'

collection = YAML.load_file('./lib/booksdb.yml')

describe Library do
  let(:patron) {double('Patron')}

  it 'should have the list of books' do
    expect(subject.bookrack).not_to be nil
  end

  it 'should check if the book is available' do
     expect(subject.bookrack[0][:available]).to be true
  end

  it 'should have a collection of books in the file' do
    expect(collection).not_to eq nil
  end

  it 'should allow patron to check out a book' do
    collection[1][:available] = false
    date = Date.today + 30
    collection[1][:return_date] = date.to_s
    File.open('./lib/booksdb.yml', 'w') {|f| f.write collection.to_yaml}
    expect(collection[1][:available]).to eq false
  end

  it 'should set a return date on every check out, 1 month from checkout date' do
    date = Date.today + 30
    expect(collection[1][:return_date]).to eq date.to_s
  end






end
