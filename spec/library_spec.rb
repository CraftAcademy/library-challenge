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
    collection[3][:available] = false
    collection[3][:return_date] = Date.today + 30
    File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    expect(collection[3][:available]).to eq false
  end

  it 'set a return date on every check out, 1 month from checkout date' do
    expect(collection[3][:return_date]).to eq Date.today + 30
  end

  it 'allow individuals to return books' do
    collection[3][:available] = true
    collection[3][:return_date] = 'in_house'
    File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    expect(collection[3][:available]).to eq true
  end

end
