require './lib/patron.rb'

describe Patron do

  let(:library) { double('Library') }

  before do
    bookshelf = YAML.load_file('./spec/fixtures/library_books.yml')
    allow(library).to receive(:bookshelf).and_return(bookshelf)
  end

  after do

  end


  it 'has a nightstand' do
    expect(subject.nightstand).not_to be nil
  end

  it 'can display library_books from author search' do
    expect(subject.search_books_by_author(library, author: 'Lowry')).not_to be nil
  end

  it 'can display library_books from title search' do
    expect(subject.search_books_by_title(library, title: 'BFG')).not_to be nil
  end

  it 'can display books with author *or* title' do
    expect( subject.search_library_bookshelf(library, title: 'BFG')).not_to be nil
  end

  it 'raises error if searching for something other than title or author' do
    expect{ subject.search_library_bookshelf(library, rating: 'green')}.to raise_error 'Please enter a title or an author'
  end

  it 'raises error if no search parameters included' do
    expect { subject.search_library_bookshelf(library, title: nil)}.to raise_error 'Your search returned no books'
  end

  it 'raises error if no books found' do
    expect{subject.search_library_bookshelf(library, title: 'adfkj')}.to raise_error 'Your search returned no books'
  end

  it 'can see if a book is available' do

  end

  it 'can check out a book from the library' do

  end

  it 'stores library books on the nightstand' do

  end

  it 'has a due date on checked-out books' do

  end

end
