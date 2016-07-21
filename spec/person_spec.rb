require './lib/library.rb'
require './lib/person.rb'

describe Person do
  let(:library) { Library.new }

  it "Is able to see a list of available books in the library" do
    expect(library.available_books).not_to be_empty
  end

  it "Shows to a person a return date for a booked item" do
    expected_date = Date.today.next_month(1).strftime("%d/%m/%y")
    expect(library.book_checkout("Alfons och soldatpappan", "Gunilla Bergström")[:return_date]).to eq expected_date
    expected_output = { title: "Alfons och soldatpappan",
                        author: "Gunilla Bergström",
                        message: "item booked successfully",
                        return_date: expected_date }
  end

  it "Shows a list of booked items with return date" do
    result = library.book_checkout("Alfons och soldatpappan", "Gunilla Bergström")
    subject.add_to_list(result)
    expected_date = Date.today.next_month(1).strftime("%d/%m/%y")
    expected_output = { title: "Alfons och soldatpappan",
                        author: "Gunilla Bergström",
                        return_date: expected_date }
    expect(subject.list[0]).to eq expected_output
  end
end
