require './lib/library.rb'
require './lib/person.rb'
require 'date'

describe Person do

  it "has a list on initialize" do
    expect(subject.booklist).to be_an_instance_of(Array)
  end

  it "allows to check the list of my books with return date" do
    library = Library.new
    book = library.check_out("Alfons och soldatpappan", "Gunilla Bergström")
    expect(book).not_to be(nil)
    subject.add_to_list(book)
    expect(subject.booklist.length).to eq(1)
    expected_date = Date.today.next_month(1).strftime("%m/%Y")
    expected_output = { title: "Alfons och soldatpappan",
                        author: "Gunilla Bergström",
                        return_date: expected_date }
    expect(subject.booklist[0]).to eq(expected_output)
  end
end
