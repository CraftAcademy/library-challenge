require './lib/person.rb'
require './lib/library.rb'

describe Person do
  let(:library) {Library.new}
# As an individual
# In order to get my hands on a good book
# I would like to see a list of books currently available in the library
# with information about the title and author
  it 'is expected to see a list of books currently available in the library' do
    expect(library.book_list).not_to be_nil
  end

# As an individual
# I would like to check out a book from the library
  it 'is expected to check out a book from the library' do
    book_title = 'Alfons och soldatpappan'
    expect(subject.checkout(title:book_title, lib:library)).to be_truthy
  end

# As an individual
# I would like to check out a book from the library
  it 'raise the library doesn\'t exist error' do
    book_title = 'Alfons och soldatpappan'
    expect{subject.checkout(title:book_title)}.to raise_error(ArgumentError, 'The library does not exist')
  end
# As an individual
# In order to avoid awkward moments at the library
# I would like to know when my book is supposed to be returned
  it 'is expected to borrow a book and get return_date' do
    book_title = 'Osynligt med Alfons'
    return_date = Date.today + Library::LOAN_DURATION
    expected_output = return_date.strftime("%d/%m/%y")
    expect(subject.checkout(title:book_title, lib:library)[:return_date]).to eq expected_output
  end

# As an individual
# I would like to have a bookshelf with my own books at the beginning
  it 'is expected to have a bookshelf with my own books at the beginning' do
    expect(subject.bookshelf.length).to be > 0
  end



end
