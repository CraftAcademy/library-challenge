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

  end
end
