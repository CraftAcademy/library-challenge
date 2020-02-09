require './lib/library.rb'
require './lib/customer.rb'
require 'Date'
    
describe Customer do 
    
    subject {described_class.new}

    it 'Shows a list of available books' do 
        expect(subject.available_books).to_not eq [{:available=> false}]
    end 

    it 'Can checkout a book' do
        expected_output = {:item=>{:title=>"Ett jävla solsken", :author=>"Fatima Bremmer"}, :available=>false, :return_date=>"10/03/20"}
        expect(subject.checkout_service(2)).to eq expected_output
    end

    it 'Can return a book' do
        
    end
end 
