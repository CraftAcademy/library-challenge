require './lib/library.rb'
require './lib/person.rb'
require 'pry'

describe Person do
  let(:library) { Library.new }

  it "Is able to see a list of available books in the library" do
    expect(library.available_books).not_to be_empty
  end
  # let(:library) { instance_double('Library') }
  #
  # before do
  #   book = { title: "Alfons och soldatpappan",
  #                       author: "Gunilla Bergström",
  #                       message: "item booked successfully",
  #                       return_date: Date.today.next_month(1).strftime("%m/%y") }
  #   allow(library).to receive(:book_checkout).and_return(book)
  #   binding.pry
  #   subject { described_class.new(library: library) }
  # end
  #
  # it "Is able to see a list of booked items" do
  #   subject.add_to_list("Alfons och soldatpappan", "Gunilla Bergström")
  #   #my_item = library.book_checkout("Alfons och soldatpappan", "Gunilla Bergström")
  #   expect(subject.list).not_to be_empty
  # end

end
