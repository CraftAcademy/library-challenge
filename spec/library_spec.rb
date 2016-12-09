require './lib/library.rb'

describe Library do
  it 'should have a collection of books' do
    collection = YAML.load_file('./lib/data.yml')
    expect(subject.collection).to eq collection
  end

  it 'should allow people to search for books by title' do
    library = Library.new
    book_title = 'Pippi Långstrump'
    expected_book = {
      item: {
        title: 'Pippi Långstrump',
        author: 'Astrid Lindgren'
      },
      available: true,
      return_date: nil
    }

    actual_book = library.search_by_title(book_title)

    expect(actual_book).to eq expected_book
  end

  it 'should allow people to search for books by title with different title' do
    library = Library.new
    book_title = 'Pappa Åberg åker utomlands'
    expected_book = {
      item: {
        title: 'Pappa Åberg åker utomlands',
        author: 'Gunilla Bergström'
      },
      available: true,
      return_date: nil
    }

    actual_book = library.search_by_title(book_title)

    expect(actual_book).to eq expected_book
  end

  it 'should allow people to search for books by author' do
    library = Library.new
    book_author = 'Astrid Lindgren'
    expected_book = {
      item: {
        title: 'Pippi Långstrump',
        author: 'Astrid Lindgren'
      },
      available: true,
      return_date: nil
    }

    actual_book = library.search_by_author(book_author)

    expect(actual_book).to eq expected_book
  end

  it 'should have books in for customers' do
  library = Library.new
  expected_books = [
    'Alfons sover igen', 'Pappa Åberg åker utomlands', 'Osynligt med Alfons', 'Pippi Långstrump', 'Pippi Långstrump går ombord'
  ]

  actual_book = library.available_books

  expect(actual_book).to eq expected_books
end


end
