require "./lib/library.rb"

RSpec.describe Library do
  describe "instance methods" do
    it { is_expected.to respond_to(:books) }
    it { is_expected.to respond_to(:search) }
  end
  it "is expected to have a collection of books as an array" do
    expect(subject.books).to be_instance_of Array
  end

  it "is expected to hold 4 books" do
    expect(subject.books.size).to eq 4
  end

  describe "a book" do
    it "is expected to have a availibility status" do
      expect(subject.books.first.keys).to include ("available")
    end
    it "is expected to have a return date" do
      expect(subject.books.first.keys).to include ("return_date")
    end
  end
end
