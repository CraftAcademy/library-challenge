require './lib/person.rb'
require './lib/library.rb'
require 'date'
require 'yaml'

describe Person do
    attr_accessor :list_books

    let(:library) {instance_double('library', collection: 'list')}
    subject { described_class.new(name: 'Zangoel')}

    it 'is expected to have a :name on initialize' do
        expect(:name).not_to be(nil)
    end

    it "Is able to see a list of available books in the library" do
        book_available = subject.book_available
        expect(subject.book_available).to_be true
      end
end

    
    #   it 'can search by title' do
    #     allow(library).to receive(:search_by_title).and_return('list of books by title')
    #     expect(subject.list_by_title(library, list, title)).to eq 'list of books by title'
    #   end
    
    #   it 'can search by author' do
    #     allow(library).to receive(:search_by_author).and_return('list of books by author')
    #     expect(subject.list_by_author(library, list, title)).to eq 'list of books by author'
    #   end
    

    # it ' can see Title and Authors of all books Available' do
    #     @collection = YAML.load_file('./lib/books.yml')
    #     # available_book_list = books_shelf.select{ |object| object[:item][:title] == title && object[:available] == true }
    #     expected_out = @collection
    #     expect{subject.collection}.to eq expected_out
    
    
    # end



    # it 'person can view books on book_shelf' do
    #     expected_out = "books you checked out #{title}, #{return_date}"
    #     expect(subject.books).to eq book_shelf
    # end

