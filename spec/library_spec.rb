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
    expected_output = { message: "Successfully booked an item",
                        title: "Alfons och soldatpappan",
                        author: "Gunilla Bergström",
                        return_date: Date.today.next_month(1).strftime("%d,%m,%y") }
    expect(subject.book_checkout("Alfons och soldatpappan", "Gunilla Bergström")).to eq expected_output
  end

  it 'return "Not available" if book is unavailable' do
    expected_output =   { message: "Book not available" }
    expect(subject.book_checkout("Skratta lagom! Sa pappa Åberg", "Gunilla Bergström")).to eq expected_output
  end

  it 'is expected to have a return date of one month after checkout' do
    expected_date = Date.today.next_month(1).strftime("%d,%m,%y")
    expect(subject.return_date).to eq expected_date
  end

  after do
   collection = YAML.load_file('./lib/data.yml')
   collection.each { |obj| obj[:available] = true }
   collection.each { |obj| obj[:return_date] = nil }
   File.open('./lib/book_data.yml', 'w') { |f| f.write collection.to_yaml }
 end
end
