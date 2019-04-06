require "date"
require "yaml"
require "./lib/library.rb"


describe Library do
    it "can read the YAML file with all the books" do
    collection = YAML.load_file("./lib/books.yml")
    expect(subject.access_books).to eq collection 
    end


end
