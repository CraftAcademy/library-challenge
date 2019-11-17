require 'library.rb'
require 'pry'
require 'date'

 #As a librarian
 #To know what books the library offers
 #I want to be able to see a list of all the library's books

 #As a librarian
 #To know if we have a certain book 
 #I want to be able to search for it by it's title

 #As a librarian
 #To help people with the checkout of the books
 #I need to be able to set a new status of the books and set a return date

 #As a librarian
 #To help people with the checkout of the books
 #I want my system to raise an error alerting me if a book is unavailable

    describe Library do

        it 'expects a library to have a list of its books' do
            expect(subject.books).not_to be nil
        end

        before { subject.list_books }
        it 'expects a list of librarys books' do
            expected_output = 'Skratta lagom! Sa pappa Åberg - Gunilla Bergström - Not availible'
            expect(subject.all_books[1]).to eq expected_output 
        end

        it 'library has a working search function for title' do
            expected_output = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>Date.today >> 1}]
            expect(subject.search("Alfons och soldatpappan")).to eq expected_output
        end

        let(:visitor) { Visitor.new }
        it 'checkout changes status of book and sets return date' do
            visitor.return_book("soldat")
            expected_output = {:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>Date.today >> 1 }
            expect { subject.checkout("Alfons och soldatpappan") }.to raise_error(RuntimeError, "Sorry, book is unavailable!")  
        end
        
        it 'raises error message for checkout if book is not available' do
            expect { subject.checkout("Skratta lagom! Sa pappa Åberg") }.to raise_error(RuntimeError, "Sorry, book is unavailable!")   
        end
end
