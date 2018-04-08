require './lib/library.rb'

describe Library do
let(:person) { instance_double('Person', name: 'Peter Johansson', personnummer: 9012241677, books: [] )}
expected_date = Date.today.next_day(30).strftime('%Y-%m-%d')
list_of_books = YAML.load_file('./lib/data.yml')
subject = Library.new('rspec')

it 'displays the list of books' do
    expect(subject.books).to eq list_of_books
end

it 'gives success message if a book is available' do
  expected_output = 'Alfons och soldatpappan checked out successfully, please return on ' + expected_date
  expect(subject.checkout(1, person)).to eq expected_output
end

it 'sets the return date 30 days from today' do
  subject.checkout(1, person)
  expect(subject.books[0][:item][:return_date]).to eq expected_date
end

it 'gives an error message if book is not available' do
  expect(subject.checkout(2, person)).to eq 'Book not available'
end

it 'shows the list of available books' do
  expect(subject.books_available.size).to eq 3
end

it 'shows return date of unavailable book' do
  expect(subject.return_date(2)).to eq '2016-05-25'
end

it 'set book availability to true, return date and name to nil when returned back' do
  subject.checkout(1, person)
  subject.return(1, person)
  expect(subject.books[0][:available]).to eq true
  expect(subject.books[0][:person]).to eq nil
  expect(subject.books[0][:return_date]).to eq nil
end

it 'clears book from account when returning borrowed book' do
  subject.return(1, person)
  expect(person.books).to eq []
end

it 'gives an error when returning a book already checked out by another person' do
  expect(subject.return(2, person)).to eq 'This book has been checked out by a different person'
end

it 'adds a new book to library' do
  subject.add_book('The Green Forest', 'Hilda Svenningsson')
  expect(subject.books.size).to eq 6
end

end
