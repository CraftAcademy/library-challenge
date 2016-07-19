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
    expected_output = { title: "Alfons och soldatpappan", author: "Gunilla Bergström", message: "item booked successfully" }
    expect(subject.book_checkout("Alfons och soldatpappan", "Gunilla Bergström")).to eq expected_output
    expect(subject.available?("Alfons och soldatpappan", "Gunilla Bergström")).to be false
  end
end
