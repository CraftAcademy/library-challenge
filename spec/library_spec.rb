require './lib/library.rb'

describe Library do
  # As a library
  # In order to have good books to offer to the public
  # I would like to be able to have a collection of books

  it 'has book list on initialize' do
    expect(subject.book_list).not_to be_empty
  end

  # As a library
  # In order to have good books to offer to the public
  # I would like to be able to allow individuals to check out a book

  it 'Reduce books from its list for check out' do
    subject.checkout( {title: 'Steve Jobs', author:'Walter Isaacsson'})
    expect(subject.book_list).to include({title:'Veg Recipes', author:'Tan Li'},
                                {title:'Thinking in C++', author:'Bruce Eckel'})
  end

  # As a library
  # A book cannot be borrowed if it is not in the list

  it 'Show No book is found if checking out a book which is not in the list' do
      expected_output = {status: false, message:'No book is found'}
      expect(subject.checkout( {title: 'Learning XML', author:'Walter Johansson'})).to eq expected_output
  end

  # As a library
  # In order to make the books available to many individuals
  # I would like to set a return date on every check out
  # and I would like that date to be 1 month from checkout date
end
