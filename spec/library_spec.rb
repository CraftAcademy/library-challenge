require 'yaml'
require './lib/library.rb'


person = YAML.load_file('./lib/person.yml')
describe Library do

  subject { described_class.new }


  it 'list of books currently available in the library' do
    expect(subject.available_books).not_to eq nil
  end

  it 'have a collection of books stored in a file' do
    expect(subject.books).not_to eq nil
  end

  it 'allow individuals to check out a book' do
    subject.person_checkout(1)
    expect(subject.books[0][:available]).to eq false
  end

  it 'set a return date on every check out, 1 month from checkout date' do
    date2 = Date.today + 30
    expect(subject.books[0][:return_date]).to eq date2.to_s
  end

  it 'check for the corect book id in Library' do
    expect(subject.books[0][:book_id]).to eq 1
  end

  it 'allow liburary to return books' do
    subject.return_book(1)
    expect(subject.books[0][:available]).to eq true
  end
end
