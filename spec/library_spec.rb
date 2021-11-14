require "./lib/library.rb"

describe Library do
  let(:book) { instance_double("Book", title: "Animal Farm", author: "George Orwell") }

  describe "can create a Book" do
    before { subject.create_book(title: book.title, author: book.author) }

    it "is expected to be an instance of Book class" do
      expect(subject.book).to be_an_instance_of Book
    end
  end

  describe "can add a book in the inventory" do
    before { subject.create_book(title: "The Picture of Dorian Gray", author: "Oscar Wilde") }

    it "is expected to add a book in the inventory" do
      expected_output = {
        status: true,
        message: "#{subject.book.title} by #{subject.book.author} added to the inventory"
      }
      expect(subject.add_book_to_inventory).to eq expected_output
    end
  end

  describe "can find a book in the inventory" do
    xit "is expected to find a book by title" do
      expect(subject.find_book(title: "Animal Farm")).to eq
    end
  end
end
