require "./lib/library.rb"
require "date"

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

    it "is expected to raise an error if no book has been created" do
      subject.book = nil
      expect { subject.add_book_to_inventory }.to raise_error "A book is required"
    end
  end

  describe "can find a book in the inventory" do
    it "is expected to find a book by title" do
      expected_output = {
        status: true,
        message: "Animal Farm found",
      }
      expect(subject.find_book(title: "Animal Farm")).to eq expected_output
    end

    it "is expected to raise an error if no title is passed in" do
      expect { subject.find_book }.to raise_error "A title is required"
    end
  end

  describe "can lend books to visitors for 1 month" do
    let(:visitor) { instance_double("Visitor", name: "Gaia") }

    before { subject.welcome_visitor(name: visitor.name) }

    it "is expected to welcome visitors" do
      expect(subject.visitor).to be_an_instance_of Visitor
    end

    it "is expected to return message with visitor name and return date" do
      subject.find_book(title: "Animal Farm")
      expected_output = "#{subject.visitor.name} has to return #{subject.book.title} no later than #{Date.today.next_month(1).strftime("%d/%m/%Y")}"
      expect(subject.lend_book).to eq expected_output
    end
  end
end
