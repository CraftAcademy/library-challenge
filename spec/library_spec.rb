require 'yaml'
require './lib/library.rb'

#collection = YAML.load_file('./lib/data.yml')
describe Library do

  subject { described_class.new(name: 'Casper') }

  it 'list all books in library' do
    expect(subject.all_books).not_to eq nil
  end

  it 'list of books currently available in the library' do
    expect(subject.available_books).not_to eq nil
  end

  it 'have a collection of books stored in a file' do
    expect(YAML.load_file('./lib/data.yml')).not_to eq nil
  end

  it 'allow individuals to check out a book' do
    expect(subject.person_checkout).to eq false
  end

  it 'set a return date on every check out, 1 month from checkout date' do
    expect(subject.return_date).to eq Date.today + 30
  end

  it 'allow individuals to return books' do
    expect(subject.return_book).to eq nil
  end

end
