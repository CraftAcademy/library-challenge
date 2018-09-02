require './lib/library.rb'
require 'date'

describe Library do

    it 'person can view books in collection on initialise' do
        expect(subject.collection).not_to be_nil 
    end


    it 'check if book is available' do
        expect(subject.book_available("Hot Night")).to be true
    end 


    it 'returns false if book is not in collection' do
        expect(subject.book_available("Bible")).to be false
    end

    it 'returns all books that are available in the library' do
        available_books = YAML.load_file('./lib/books.yml')
        expect(subject.available_books).to eq available_books
    end

    it 'gives a return date of a month' do
        set_return_date = Date.today.next_month.strftime('%d/%m/%y')
        expect(subject.return_date).to eq set_return_date
    end

    it 'check out book if available' do
        return_date =  Date.today.next_month.strftime('%d/%m/%y')
        expected_output = "Thank you for checking out, please return by #{return_date}"
        expect(subject.checkout_a_book('Hot Night')).to eq expected_output
    end
end