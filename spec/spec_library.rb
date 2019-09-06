 #YAML for database with list of available 
    #books (title, author availability)
require './lib/library.rb'
require 'date'

describe Library do

    it 'is expected to see the title of a book' do
        expect(subject.title).not_to be nil
    end

    it 'is expected to see the author of a book' do 
        expect(subject.author).not_to be nil
    end

    it 'is expected to see the availability of a book' do
        expect(subject.available).to eq :true
    end

    it 'is expected to store all books in an easily accessable file' do
        expect()
    end

    it 'is expected to track the status and availability of books' do
        expect()
    end

    it 'is expected to set a required date of return of one month for every book' do
        expected_date = Date.today.next_month(1).strftime("%d/%m")
        expect(subject.return_date).to eq expected_date
    end
   
end