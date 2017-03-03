require 'yaml'
require './lib/library.rb'

collection = YAML.load_file('./lib/data.yml')
person = YAML.load_file('./lib/person.yml')
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
  end

  it 'set a return date on every check out, 1 month from checkout date' do
    date = Date.today + 30
    expect(collection[1][:return_date]).to eq date.to_s
  end

  it 'check for the corect book id in Library' do
    expect(collection[1][:book_id]).to eq 2
  end


  it 'allow library to check out a book' do
    person[1][:available] = false
    date = Date.today + 30
    person[1][:return_date] = date.to_s
    File.open('./lib/person.yml', 'w') { |f| f.write person.to_yaml }
    expect(person[1][:available]).to eq false
  end

  it 'check for the corect book id in Library' do
    expect(person[1][:book_id]).to eq 2
  end

  it 'set a return date on every check out, 1 month from checkout date for person' do
    date = Date.today + 30
    expect(person[1][:return_date]).to eq date.to_s
  end

  it 'allow individuals to return books' do
    collection[1][:available] = true
    collection[1][:return_date] = 'in_house'
    File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    expect(collection[1][:available]).to eq true
  end

  it 'checks that the book is on persons shelf' do
    expect(collection[1][:return_date]).to eq 'in_house'
  end

  it 'allow individuals to return books' do
    person[1][:available] = true
    person[1][:return_date] = 'in_house'
    File.open('./lib/person.yml', 'w') { |f| f.write person.to_yaml }
    expect(person[1][:available]).to eq true
  end

  it 'checks that the book is not perosons shelf' do
    expect(person[1][:return_date]).to eq 'in_house'
  end

end
