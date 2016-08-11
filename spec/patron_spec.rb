require './lib/patron.rb'

describe Patron do

  let(:library) { double('Library') }


  before do
    bookshelf = YAML.load_file('./spec/fixtures/library_books.yml')
    allow(library).to receive(:release_book_to_patron).and_return({:item=>
       {:title=>"I Do Not Like Green Eggs and Ham",
        :author=>"Doctor Seuss"},
      :available=>false,
      :due_date=>'2016-09-15'})
    allow(library).to receive(:bookshelf).and_return(bookshelf)
  end

  after do

  end

  it 'expects there to be a library' do
    expect(library).not_to be nil
  end

  it 'has a nightstand' do
    expect(subject.nightstand).not_to be nil
  end

  it 'can find books with a title' do
    expect( subject.search_library_bookshelf(library, title: 'BFG')).not_to be nil
  end

  it 'can find books with an author' do
    expect( subject.search_library_bookshelf(library, author: 'Lowry')).not_to be nil
  end

  it 'raises error if searching for something other than title or author' do
    expect{ subject.search_library_bookshelf(library, rating: 'green')}.to raise_error 'Please enter a title or an author'
  end

  it 'raises error if no search parameters included' do
    expect { subject.search_library_bookshelf(library, title: nil)}.to raise_error 'Please enter a title or an author'
  end

  it 'raises error if no books found' do
    expect{subject.search_library_bookshelf(library, title: 'adfkj')}.to raise_error 'Your search returned no books'
  end

  describe 'Patron has found books by a search' do
    before do subject.search_library_bookshelf(library, author: 'Dahl')
    end

    it 'can check out a book from the library if it is available' do
      expect(subject.check_out_from_library(0)).to be_truthy
    end

    # it 'raises an error when patron tries to check out an unavailable book' do
    #
    # end
    #
    # it 'stores library books on the nightstand' do
    #
    # end
    #
    # it 'has a due date on checked-out books' do
    #
    # end
  end
end
