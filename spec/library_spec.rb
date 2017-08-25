require './lib/library.rb'
require './lib/patron.rb'

describe Library do

  it "Has an availale list of books" do
    expect(:books).not_to be_empty
  end

  it "Checks that a book is available" do
      expect(subject.available?("Alfons och soldatpappan", "Gunilla Bergström")).to be true
  end
end
