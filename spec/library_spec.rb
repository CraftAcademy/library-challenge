require './lib/library.rb'
require 'date'

describe Library do
  books = [{title: 'The Secret',
            author: 'Rhonda Byrne',
            book_status: :avilable,
            person: :non,
            return_date: ''},
           {title: 'The Da Vinci Code',
            author: 'Dan Brown',
            book_status: :not_avilable,
            person: :user,
            return_date: "25-02-2016"}]

  subject { described_class.new(list_of_books: books) }

  let(:person) { double('person') }

  it 'Has an array of books' do
    expect(subject.list_of_books).to be_kind_of Array
  end
end
