require './lib/library.rb'
require './lib/person.rb'

describe Library do
  it "Has a not empty collection of books" do
    expect(:books).not_to be_empty
  end

  it "Checks that a book is available" do
    expect(subject.is_available?("Alfons och soldatpappan", "Gunilla Bergström")).to be true
  end
end
