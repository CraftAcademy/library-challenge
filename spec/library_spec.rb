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
    subject.person_checkout(1)
    expect(collection[0][:available]).to eq false
  end

  it 'set a return date on every check out, 1 month from checkout date' do
    date2 = Date.today + 30
    expect(collection[0][:return_date]).to eq date2.to_s
  end

  it 'check for the corect book id in Library' do
    expect(collection[0][:book_id]).to eq 1
  end

  it 'check for the corect book id in Library' do
    expect(person[0][:book_id]).to eq 1
  end

  it 'set a return date on every check out, 1 month from checkout date for person' do
    date = Date.today + 30
    expect(person[0][:return_date]).to eq date.to_s
  end

  it 'checks that the book is on persons shelf' do
    expect(person[0][:available]).to eq true
  end

end
