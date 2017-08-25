require './lib/library.rb'
require './lib/patron.rb'
require 'date'

describe Library do

  it "Has an availale list of books" do
    expect(:books).not_to be_empty
  end

  it "Checks that a book is available" do
      expect(subject.available?("Alfons och soldatpappan", "Gunilla Bergström")).to be true
  end

  it 'is expected to have a return date' do
  expected_date = Date.today.next_month(1).strftime("%m,%y")
  expect(subject.return_date).to eq expected_date
  end
end
