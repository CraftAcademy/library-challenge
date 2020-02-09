
require './lib/library.rb'
require 'yaml'

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
        expected_output = [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
        expect(subject.search_author('Astrid')).to eq expected_output
    end

    it 'Checks if you can search for a book by title' do
        expected_output = [{:item=>{:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}]
        expect(subject.search_title('Åberg')).to eq expected_output
    end

    #As a member I want to be able to see only the list of available books
    it 'Gives only the list of available books' do
        expect(subject.list_of_available_books).to be_truthy
    end

    #As a librarian I want to be able to see which books are not in the library
    it 'Gives a list of unavailable books' do
        expect(subject.list_of_unavailable_books).to be_truthy
    end

    #As a librarian I would like a book to no longer be available once somebody borrows it
    it 'Checks if you can change availible status on a book once borrowed' do
        subject.change_availability(0)
        expect(subject.collection[0][:available]).to eq false 
    end

    #As a librarian I would like that a customer can borrow a book for no more then 30 days
    it 'Checks that a return date is set for 30 days once book has been borrowed' do
        subject.setReturnDate(0)
        expect(subject.collection[0][:return_date]).to eq Date.today.next_day(30).strftime('%Y-%m-%d')
    end

    #As a user I would like to know which book I've borrowed and when is a return date
    it 'Checks if the receipt has a return date and title' do
    expected_output = {title: 'Alfons och soldatpappan', available: false, return_date: Date.today.next_day(30).strftime('%Y-%m-%d')}
    expect(subject.lend_book(0)).to eq expected_output
end

end



    
  







