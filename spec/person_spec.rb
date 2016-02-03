require './lib/person.rb'
require './lib/library.rb'

describe Person do
  books = [{title: 'Managment101', author: 'Rich'}, {title: 'Cooking101', author: 'Fat'}]

  #let(:library) { double(:library, books: books) }
  let(:library) { Library.new }

  before do
    books.each do |book|
      library.check_in(book)
    end
  end

  it 'constract of empty array at start' do
    expect(subject.portfolio).to eq []
  end

  context 'adding book to portfolio' do

    let(:actual_book) do
      {title: 'Managment101',
       author: 'Rich',
       duedate: Date.today.next_month.strftime('%F')}
    end

    before do
     # allow(library).to receive(:lend).and_return({})
    end

    it 'searched by :title' do
      subject.rent(library, title: 'Managment101')
      expect(subject.portfolio).to include actual_book
    end

    it 'searched by :author' do
      subject.rent(library, author: 'Rich')
      expect(subject.portfolio).to include actual_book
    end
  end
end
