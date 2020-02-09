require './lib/library.rb'
require './lib/customer.rb'
require 'Date'
    
describe Customer do 
    
    subject {described_class.new}

    it 'Shows a list of available books' do 
        expect(subject.available_books).to_not eq [{:available=> false}]
    end 

    it 'to search for a book with only part of, or the whole title' do
        expected_output = [{:item=>{:title=>"In search of lost time", :author=>"Marcel Proust"}, :available=>true, :return_date=>nil}] 
        expect(subject.search_title("of lost")).to eq expected_output
    end

    it 'to search for a book with only part of, or the whole authors name' do
        expected_output = [{:item=>{:title=>"In search of lost time", :author=>"Marcel Proust"}, :available=>true, :return_date=>nil}] 
        expect(subject.search_author("Proust")).to eq expected_output
    end

    it 'Can checkout a book' do
        expected_output = {:item=>{:title=>"Ett jävla solsken", :author=>"Fatima Bremmer"}, :available=>false, :return_date=>"10/03/20"}
        expect(subject.checkout_service(2)).to eq expected_output
    end

    it 'Can return a book' do
        expected_output = {:item=>{:title=>"Ett jävla solsken", :author=>"Fatima Bremmer"}, :available=>true, :return_date=>nil}
        expect(subject.checkin_service(2)).to eq expected_output
    end

end 
