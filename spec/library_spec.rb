require './lib/library.rb'
require './lib/person.rb'

describe Library do
  it "Has a not empty collection of books" do
    expect(:books).not_to be_empty
  end

  it "Checks that a book is available" do
    expect(subject.available?("Alfons och soldatpappan", "Gunilla Bergström")).to be true
  end

  it "Allows individuals to check out a book" do
    expected_output = { title: "Alfons och soldatpappan",
                        author: "Gunilla Bergström",
                        message: "item booked successfully",
                        return_date: Date.today.next_month(1).strftime("%d/%m/%y") }
    expect(subject.book_checkout("Alfons och soldatpappan", "Gunilla Bergström")).to eq expected_output
    expect(subject.available?("Alfons och soldatpappan", "Gunilla Bergström")).to be false
  end

  it "Sets a return date for a booked item to 1 month after check out" do
    expected_date = Date.today.next_month(1).strftime("%d/%m/%y")
    expected_output = { title: "Alfons och soldatpappan",
                        author: "Gunilla Bergström",
                        message: "item booked successfully",
                        return_date: expected_date }
    expect(subject.book_checkout("Alfons och soldatpappan", "Gunilla Bergström")[:return_date]).to eq expected_date
  end

  it "Returns an error message if trying to check out unavailable books" do
    expect { subject.book_checkout("Osynligt med Alfons", "Gunilla Bergström") }.to raise_error "This book is not available"
  end
end
