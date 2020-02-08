require './lib/library.rb'

describe Library do 

    subject {described_class.new}

    it 'to see that the library has a list of books' do 
        expect(subject.collection).to_not eq nil
    end 

    it 'to see a list of all books' do
        expect(subject.list).to eq nil
    end

    it 'to see a list of only available books' do
    expect(subject.available_books).to_not eq [{:available=> false}]
    end   
    
    it 'to search for a book with only part of, or the whole title' do
        expected_output = [{:item=>{:title=>"In search of lost time", :author=>"Marcel Proust"}, :available=>true, :return_date=>nil}] 
        expect(subject.select_title("of lost")).to eq expected_output
    end

    it 'to search for a book with only part of, or the whole authors name' do
        expected_output = [{:item=>{:title=>"In search of lost time", :author=>"Marcel Proust"}, :available=>true, :return_date=>nil}] 
        expect(subject.select_author("Proust")).to eq expected_output
    end
end

