require 'yaml'
require './lib/library.rb'

collection = YAML.load_file('./lib/data.yml')
describe Library do

  subject { described_class.new }

  it 'list all books in library' do
    expect(subject.all_books).not_to eq nil
  end

  it 'list of books currently available in the library' do
    expect(subject.available_books).not_to eq nil
  end

  it 'have a collection of books stored in a file' do
    expect(collection).not_to eq nil
  end

  it 'allow individuals to check out a book' do
    collection[1][:available] = false
    date = Date.today + 30
    collection[1][:return_date] = date.to_s
    File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    expect(collection[1][:available]).to eq false
    expect(collection[1][:return_date]).to eq date.to_s
  end

  it 'set a return date on every check out, 1 month from checkout date' do
    date = Date.today + 30
    expect(collection[1][:return_date]).to eq date.to_s
  end

  it 'allow individuals to return books' do
    collection[1][:available] = true
    collection[1][:return_date] = 'in_house'
    File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    expect(collection[3][:available]).to eq true
  end

end
