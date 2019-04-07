require "./lib/visitor.rb"

describe Visitor do
    subject {described_class.new("Giorgos")}

    after do
        reset = YAML.load_file("./lib/reset.yml")
        File.open("./lib/books.yml", "w") {|f| f.write reset.to_yaml}
    end
    
    it "can view the list of all books Library has, as well as if they are available and a return date of the unavailable ones, but not the name of borrower" do
        expected_output = [{:index=>0, :title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström", :available=>true, :return_date=>nil}, {:index=>1, :title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström", :available=>true, :return_date=>nil}, {:index=>2, :title=>"Osynligt med Alfons", :author=>"Gunilla Bergström", :available=>true, :return_date=>nil}, {:index=>3, :title=>"Pippi Långstrump", :author=>"Astrid Lindgren", :available=>true, :return_date=>nil}, {:index=>4, :title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren", :available=>true, :return_date=>nil}]
        expect(subject.view_books).to eq expected_output
    end

    it "can search the list of books by the title of the book" do
        expected_output = [{:index=>3, :title=>"Pippi Långstrump", :author=>"Astrid Lindgren", :available=>true, :return_date=>nil}, {:index=>4, :title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren", :available=>true, :return_date=>nil}]
        expect(subject.search_by_title("Pippi")).to eq expected_output
    end

    it "can search the list of books by the author of the book" do
        expected_output = [{:index=>3, :title=>"Pippi Långstrump", :author=>"Astrid Lindgren", :available=>true, :return_date=>nil}, {:index=>4, :title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren", :available=>true, :return_date=>nil}]
        expect(subject.search_by_author("Lindgren")).to eq expected_output
    end

    it "can check out a book" do
        expected_output = "You have successfully borrowed the book 'Pippi Långstrump' by Astrid Lindgren. Please return it by #{Date.today.next_month.strftime("%d/%m/%y")}."
        expect(subject.checkout_book(3)).to eq expected_output
    end

    it "can find out if they have borrowed any books" do
        expect(subject.my_books).to eq "You have not borrowed any books"
    end

    it "can find out what books they have borrowed" do
        subject.checkout_book(1)
        expect(subject.my_books).to eq "Happy reading!"
    end

end
