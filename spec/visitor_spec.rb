require './lib/visitor.rb'

describe Visitor do


  #In order to borrow a book, the visitor should be able to search by keywords

  it 'can search for a certain book' do
    expect(subject.book_by_keywords).not_to eq nil

  end

  #In order to checkout a book, we need to modify the status of them




end