require './lib/library.rb'
# require '../lib/books.yml'
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

    it 'gives a return date of a month' do
        set_return_date = Date.today.next_month.strftime('%d/%m/%y')
        expect(subject.return_date).to eq set_return_date
    end

    # it 'checkout book and get return date' do
    #     return_date = Date.today.next_month(1).strftime('%d/%m/%y')
    # expect(subject.return_date).to eq return_date
    # end
end



# it 'check book available in collection' do
#     book.available = true 
# end