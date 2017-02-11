require './lib/library.rb'

describe Library do

  let(:person) { double('Person', checkout_books: true)}

  it 'has a list of books on initialize' do
    library = Library.new
    expected_output = { title: '', author: '', available: '', return_date: '' }
  end

  xit 'should be able to lend books to the person' do

  end

  xit 'should set a return date when lending books to person to be 30 days from now' do

  end

end
