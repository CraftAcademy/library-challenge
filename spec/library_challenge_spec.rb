require './lib/library_challenge.rb'

describe Library do

    it "has a list of books" do
        expect(subject.book_list).not_to be_nil
    end

    it "shows all the books in the list" do
        expected_outcome = YAML.load_file('./lib/data.yml')
        expect(subject.all_books).to eq expected_outcome
    end 

    it "searches for available books in the list" do
        expected_list = YAML.load_file('./lib/data.yml') #if all books in that file are marked available
        expect(subject.available_books).to eq expected_list  
    end 

end


