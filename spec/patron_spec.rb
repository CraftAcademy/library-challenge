require './lib/patron.rb'

describe Patron do

  arr_books = [{ item: { title: "Pippi Långstrump", author: "Astrid Lindgren" },
     available: false, return_date: (Date.today+30).to_s }]


  let(:library) { Library.new }

  let(:item) { { title: "Osynligt med Alfons", author: "Gunilla Bergström" } }
  let(:item2) { { title: "Pippi Långstrump", author: "Astrid Lindgren" } }


  it "can borrow a book that is available" do
    expected_output = { item: { title: "Osynligt med Alfons",
      author: "Gunilla Bergström" }, available: false,
      return_date: (Date.today+30).to_s }
    expect(subject.borrow_book(item: item, library: library)).to eq expected_output
  end

  it "can see list of books borrowed by the patron" do
    subject.borrow_book(item: item2, library: library)
    expected_output = arr_books
    expect(subject.borrowed_books).to eq expected_output
  end

end
