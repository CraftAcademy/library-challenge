require "date"
require "yaml"
require "./lib/library.rb"


describe Library do

    after do
    reset = YAML.load_file("./lib/reset.yml")
    File.open("./lib/books.yml", "w") {|f| f.write reset.to_yaml}
    end
    
    it "can read the YAML file with all the books" do
        expected_output = YAML.load_file("./lib/books.yml")
        expect(subject.books).to eq expected_output 
    end

    it "can search the YAML file by title" do
        expected_output = [{:index=>3, :title=>"Pippi Långstrump", :author=>"Astrid Lindgren", :available=>true, :return_date=>nil, :borrowed_by=>nil}, {:index=>4, :title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren", :available=>true, :return_date=>nil, :borrowed_by=>nil}]
        expect(subject.search_by_title("Pippi")).to eq expected_output
    end

    it "can search the YAML file by author" do
        expected_output = [{:index=>3, :title=>"Pippi Långstrump", :author=>"Astrid Lindgren", :available=>true, :return_date=>nil, :borrowed_by=>nil}, {:index=>4, :title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren", :available=>true, :return_date=>nil, :borrowed_by=>nil}]
        expect(subject.search_by_author("Lindgren")).to eq expected_output
    end

    it "can check out the book by index number and visitors name and update YAML" do
        expected_output = {:index=>3, :title=>"Pippi Långstrump", :author=>"Astrid Lindgren", :available=>false, :return_date=>Date.today.next_month.strftime("%d/%m/%y"), :borrowed_by=>"Giorgos"}
        expect(subject.checkout_book(3, "Giorgos")).to eq expected_output
    end

    it "can add a new book into the YAML file" do
        expect(subject.add_new_book("Dandelion wine", "Ray Bradbury")).to eq "Book successfully added to the database"
    end

    it "can check in the book into the YAML file when it is returned by the visitor" do
        subject.checkout_book(3, "Giorgos")
        expect(subject.return_book(3)).to eq "Book succsessfully returned!"
    end


    
end


