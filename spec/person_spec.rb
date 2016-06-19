require './lib/library.rb'
require './lib/person.rb'
require 'yaml'
require 'date'
require 'pry-byebug'

describe Person do

  subject { Person.new }

  it 'expect to have an empty bookshelf on initialize' do
     expect(subject.bookshelf).to be_empty
  end

  it 'expects to return no checked out books if bookshelf empty' do
    expect(subject.status_of_checked_out_books).to eq 'No checked out books'
  end

  # it 'displays return date of books in the bookshelf' do
  #   expect(subject.status_of_checked_out_books).to eq
  # end


end
