#require 'yaml'
require './lib/library.rb'

#collection = YAML.load_file('./lib/data.yml')
describe Library do

  it 'list of books currently available in the library' do
    expect(subject.books_available).not_to eq nil
  end

  it 'have a collection of books stored in a file' do
    expect(collection).not_to eq nil
  end

  it 'allow individuals to check out a book' do
    expect(subject.person.checkout).to eq true
  end

  it 'set a return date on every check out, 1 month from checkout date' do
    expect(subject.checkout_date + 30).to eq to subjectreturn_date
  end

end
