require './lib/library.rb'
require './lib/patron.rb'
require 'date'

describe Library do

  it "has an availale list of books" do
    expect(subject.collection).to be_an_instance_of(Array)
  end

  it "checks that a book is available" do
    expect(subject.available?("Alfons och soldatpappan", "Gunilla Bergström")).to be true
  end

  it 'allows to check out a book' do
    expected_output = { message: "Successfully booked an item" }
    expect(subject.book_checkout("Alfons och soldatpappan", "Gunilla Bergström")).to eq expected_output
  end

  it 'is expected to have a return date of one month after checkout' do
    expected_date = Date.today.next_month(1).strftime("%d,%m,%y")
    expect(subject.return_date).to eq expected_date
  end
end
