require "date"
require "yaml"
require "./lib/library.rb"


describe Library do
    
    it "can read the YAML file with all the books" do
        books = YAML.load_file("./lib/books.yml")
        expect(subject.access_books).to eq books 
    end

    it "can search the YAML file by title" do
        books = YAML.load_file("./lib/books.yml")
        expected_output = [{:index=>3, :title=>"Pippi Långstrump", :author=>"Astrid Lindgren", :available=>true, :return_date=>nil}, {:index=>4, :title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren", :available=>true, :return_date=>nil}]
        expect(subject.search_by_title("Pippi")).to eq expected_output
    end


end
