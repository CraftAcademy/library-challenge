
require './lib/library.rb'
# As a programmer            
# So that the game can be played according to the rules            
# I want a normal number to return that number

describe Library do

    subject { described_class.new }
   #As a member I want library to have books

    it 'Checks if the library collection is not empty' do
        expect(subject.collection).to_not eq nil
    end

    it 'Checks if the library has the book "Alfons och soldatpappan"' do
        expect(subject.collection[0][:item][:title]).to include("Alfons och soldatpappan")
    end

    #As a member I want to be able to search for a book by author or title

    it 'Checks if you can search for a book by the author' do
        expect(subject.search_author('Astrid')).to be_truthy
    end

    it 'Checks if you can search for a book by title' do
        expect(subject.search_title('pippi')).to be_truthy
    end

    ##  As a citizen I would like to use our public libraries
    ##  To have something to read
    ##  I should be able to lend a book to read it

    #As a librarian I would like that a customer can borrow a book for no more then 30 days
    
    #As a librarian i would like my collection to be in alphabetical order by author.

    #As user I want to be able to find a book by keyword

    #As a user I want to be able to know if the book is available



    #it 'Checks if the book is you can change availible status' do
     #   subject.change_availability(0)
      #  expect(subject.collection[0][:available]).to eq false
    #end

    

end

