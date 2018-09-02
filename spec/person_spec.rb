# 1As an  individual
# 2In order to get my hands on a good  book
# 3I would  like to see a list of books  currently  available  in the  library
# 4with  information  about  the  title  and  author

# 1As an  individual
# 2In order to avoid  awkward  moments  at the  library
# 3I would  like to know  when my book is  supposed  to be  returned
require './lib/person.rb'
require 'date'
require 'yaml'
require './lib/library.rb'

describe Person do

    subject { described_class.new(name: 'Zangoel')}

    let(:library) {instance_double('library', collection: YAML.load_file('./lib/books.yml'))}

    it 'is expected to have a :name on initialize' do
        expect(:name).not_to be(nil)
    end

    it ' can see Title and Authors of all books Available' do
        @collection = YAML.load_file('./lib/books.yml')
        # available_book_list = books_shelf.select{ |object| object[:item][:title] == title && object[:available] == true }
        expected_out = @collection
        expect{subject.collection}.to eq expected_out
    
    
    end



    # it 'person can view books on book_shelf' do
    #     expected_out = "books you checked out #{title}, #{return_date}"
    #     expect(subject.books).to eq book_shelf
    # end


end