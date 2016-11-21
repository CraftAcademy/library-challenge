require './lib/library.rb'

describe Library do
  # let(:patron) { instance_double('Patron', name: 'Fredrik', borrowed_books: { title: 'Pippi Långstrump' }) }

  it 'can present a list of books that are available' do
    expected_output = [
      'Alfons och soldatpappan',
      'Osynligt med Alfons',
      'Pippi Långstrump',
      'Pippi Långstrump går ombord']
    expect(subject.list_available_books).to eq expected_output
  end

end
