require './lib/library.rb'
require 'Date'

describe Library do 

    subject {described_class.new}

    it 'to see that the library has a list of books' do 
        expect(subject.collection).to_not eq nil
    end 

    it 'to see a list of all books' do
        expect(subject.list).to_not eq nil
    end

    it 'to see a list of only unavailable books' do
        expect(subject.unavailable_books).to_not eq [{:available=> true}]
    end   
    
    it 'to search for a book with only part of, or the whole title' do
        expected_output = [{:item=>{:title=>"In search of lost time", :author=>"Marcel Proust"}, :available=>true, :return_date=>nil}] 
        expect(subject.search_title("of lost")).to eq expected_output
    end

    it 'to search for a book with only part of, or the whole authors name' do
        expected_output = [{:item=>{:title=>"In search of lost time", :author=>"Marcel Proust"}, :available=>true, :return_date=>nil}] 
        expect(subject.search_author("Proust")).to eq expected_output
    end

    it 'to be able to see what date the books has to be returned' do 
        expected_date = Date.today.next_day(30).strftime('%d/%m/%y')
        expect(subject.set_return_date).to eq expected_date
    end 
end

