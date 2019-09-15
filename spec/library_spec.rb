require './lib/library.rb'
require 'date'

describe Library do
  it 'needs to have access to a database of books' do
    expect(subject.data).not_to be nil
  end

  it 'needs to print a list of available books, both title and author name' do
    expected_output = ["Alfons och soldatpappan : Gunilla Bergström", "Osynligt med Alfons : Gunilla Bergström", "Pippi Långstrump : Astrid Lindgren", "Pippi Långstrump går ombord : Astrid Lindgren"]
    expect(subject.find_available_books).to eq expected_output
  end

  it 'needs to calculate a date, 30 days from current date' do
    return_date = String(Date.today + 30)
    expect(subject.calculate_return_date).to eq return_date
  end
end
