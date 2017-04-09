require './lib/library.rb'


describe Library do
  let(:patron) { instance_double('Patron')}

  before do
    allow(patron).to receive(:borrowed_books).and_return([])
    allow(patron).to receive(:borrowed_books=)
  end

  it "has a collection of all books" do
    expect(subject.collection).to be_instance_of(Array)
  end

  describe 'book check-out' do
    it "is able to check out a book to a patron" do
      item = { title: "Osynligt med Alfons", author: "Gunilla Bergström" }
      expected_output = { item: { title: "Osynligt med Alfons",
        author: "Gunilla Bergström" }, available: false,
        return_date: (Date.today+30).to_s }
      expect(subject.book_check_out(item, patron)).to eq expected_output
    end

    it "is not able to check out a book that is already checked-out" do
      item = { title: "Osynligt med Alfons", author: "Gunilla Bergström" }
      expected_output = 'Book is not available'
      expect(subject.book_check_out(item, patron)).to eq expected_output
    end

    it "is not able to check out a book that the library does own" do
      item = { title: "Bok som inte finns", author: "Bogus Person" }
      expected_output = 'Library does not have this book'
      expect(subject.book_check_out(item, patron)).to eq expected_output
    end
  end

end
