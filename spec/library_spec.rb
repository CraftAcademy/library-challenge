require './lib/library.rb'


describe Library do
  let(:patron) { instance_double('Patron')}

  av_books = [{ item: { title: "Alfons och soldatpappan",
    author: "Gunilla Bergström" },available: true, return_date: nil },
    { item: { title: "Osynligt med Alfons", author: "Gunilla Bergström" },
    available: true, return_date: nil }, { item: { title: "Pippi Långstrump",
    author: "Astrid Lindgren" }, available: true, return_date: nil }]

  before do
    allow(patron).to receive(:borrowed_books).and_return([])
    allow(patron).to receive(:borrowed_books=)
  end

  it "has a collection of all books" do
    expect(subject.collection).to be_instance_of(Array)
  end

  it "can show a list of books available" do
    expected_output = av_books
    expect(subject.available_books).to eq expected_output
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
      expected_output = 'Book is not available. It will be returned ' +
        (Date.today + 30).to_s
      expect(subject.book_check_out(item, patron)).to eq expected_output
    end

    it "is not able to check out a book that the library does not own" do
      item = { title: "Bok som inte finns", author: "Bogus Person" }
      expected_output = 'Library does not have this book'
      expect(subject.book_check_out(item, patron)).to eq expected_output
    end
  end

end
