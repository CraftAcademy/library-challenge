require './lib/library.rb'

describe Library do

expected_date = Date.today.next_day(30).strftime('%Y-%m-%d')

it 'displays the list of books' do
  expected_output = YAML.load_file('./lib/data.yml')
  expect(subject.books).to eq expected_output
end

it 'giving success message if a book is available' do
  expected_output = 'Alfons och soldatpappan checked out successfully, please return on ' + expected_date
  expect(subject.checkout(1, 'Michael')).to eq expected_output
end

it 'sts the return date 30 days from today'
subject.checkout(1,'Michael')
expect(subject.books[0][:return_date]).to eq expected_date
end

it 'giving error message if book is not available' do
  expect(subject.checkout(2, 'Stefan')).to eq 'Book not available'
end



end
