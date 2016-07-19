require './lib/library.rb'
require './lib/person.rb'

describe Person do
  let(:library) { instance_double('Library') }

  before do
    book = { title: "Alfons och soldatpappan",
                        author: "Gunilla Bergström",
                        message: "item booked successfully",
                        return_date: Date.today.next_month(1).strftime("%m/%y") }
    allow(library).to receive(:book_checkout).and_return(book)
  end

  it "Is able to see a list of booked items" do
    my_item = library.book_checkout("Alfons och soldatpappan", "Gunilla Bergström")
    expect(subject.list).not_to be_empty
  end

end
