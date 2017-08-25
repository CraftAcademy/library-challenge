require './lib/library.rb'
require './lib/patron.rb'

describe Library do
  it "Has an availale list of books" do
    expect(:books).not_to be_empty
end
end
