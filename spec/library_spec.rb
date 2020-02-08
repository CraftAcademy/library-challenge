require './lib/library.rb'

describe Library do 

    subject {described_class.new}

    it 'to see that the library has a list of books' do 
        expect(subject.collection).to_not eq nil
    end 

    it 'to search for a specific book by author' do
        expect(subject.collection[2][:item][:author]).to eq 'Fatima Bremmer'
    end

    it 'to search for a specific book by title' do 
        expect(subject.collection[1][:item][:title]).to eq "Bränn alla mina brev"
    end
    
    it 'to search for a book with only part of the title' do
        expected_output = [{:item=>{:title=>"In search of lost time", :author=>"Marcel Proust"}, :available=>true, :return_date=>nil}] 
        expect(subject.collection.select {|book| book[:item][:title].include? "of lost"}).to eq expected_output
    end
end