require "./lib/library.rb"

RSpec.describe Library do
  after(:each) do
    test_data = YAML.load_file("./spec/test_data.yml")
    File.open("./lib/data.yml", "w") { |file| file.write test_data.to_yaml }
  end

  describe "instance methods" do
    it { is_expected.to respond_to(:books) }
    it { is_expected.to respond_to(:search) }
    it { is_expected.to respond_to(:checkout) }
  end
  it "is expected to have a collection of books as an array" do
    expect(subject.books).to be_instance_of Array
  end

  it "is expected to hold 4 books" do
    expect(subject.books.size).to eq 4
  end

  describe "a book" do
    it "is expected to have a availibily status" do
      expect(subject.books.first.keys).to include("available")
    end
    it "is expected to have a return date" do
      expect(subject.books.first.keys).to include("return_date")
    end
  end

  describe "#search" do
    describe "using title" do
      it "is expected to return one object" do
        book = subject.search("Lord of the flies")
        expected_result = {
          :book => {
            :title => "Lord of the flies",
            :author => "William Golding",
          },
          "available" => true,
          "return_date" => "",
        }
        expect(book).to eq(expected_result)
      end
    end
  end

  describe "#checkout" do
    #let(:person) { instance_double("Person", book_shelf: []) }

    before do
      @book = subject.search("Lord of the flies")
      subject.checkout(@book, person)
    end

    it "is expected to set availability to false" do
      expect(@book["available"]).to eq false
    end

    it "is expected to set return_date to today + 1 month" do
      expected_return_date = Date.today.next_month.strftime("%Y-%m-%d")
      expect(@book["return_date"]).to eq expected_return_date
    end
    it "is expected to add book to persons book_shelf" do
      expect(person.book_shelf).to include @book
    end

    describe "the book in memory" do
      before do
        @book = subject.books.detect { |item| item[:book][:title] == "Lord of the flies" }
      end

      it "is expected to be updated with new availability" do
        expect(@book["available"]).to eq false
      end

      it "is expected to be updated with new return date" do
        expect(@book["return_date"]).to_not eq ""
      end
    end
    describe "in storage" do
      before do
        books = YAML.load_file("./lib/data.yml")
        @book = books.detect { |object| object[:book][:title] == "Lord of the flies" }
      end

      it "is expected to be updated with new availability" do
        expect(@book["available"]).to eq false
      end

      it "is expected to be updated with new return date" do
        expect(@book["return_date"]).to_not eq ""
      end
    end
  end
end
