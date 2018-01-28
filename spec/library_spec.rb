require './lib/library.rb'
require 'date'

describe Library do

  it "has a list of books" do
    expect(subject.collection).to be_an_instance_of(Array)
  end

  it "allows to search for all available books" do
    subject.available_books do |book|
      expect(book[:available]).to be_truthy
    end
  end

  it "allows to check that a book is available" do
    expect(subject.search("Alfons och soldatpappan", "Gunilla Bergström")).not_to eq(nil)
  end

  it "allows person to check out existant and available book" do
    book = subject.search("Alfons och soldatpappan", "Gunilla Bergström")
    expect(subject.does_not_exists?(book)).to be_falsey
    expect(subject.is_not_available?(book)).to be_falsey
    subject.check_out_book(book)
    expect(book[:available]).to be_falsey
    expected_date = Date.today.next_month(1).strftime("%m/%Y")
    expect(book[:return_date]).to eq expected_date
  end

  it "return success message if item is booked" do
    expect(subject.check_out("Alfons och soldatpappan", "Gunilla Bergström")).to eq("Item successfully booked.")
  end

  it "return error message if item is not existant" do
    expect(subject.check_out("Stephen King", "Shining")).to eq("This book is not in our catalogue.")
  end

  it "return error message if item is not available" do
    subject.check_out("Alfons och soldatpappan", "Gunilla Bergström")
    expect(subject.check_out("Alfons och soldatpappan", "Gunilla Bergström")).to eq("This book is not available.")
  end

  it "sets a return date of 1 month from check out date" do
    expected_date = Date.today.next_month(1).strftime("%m/%Y")
    expect(subject.return_date).to eq expected_date
  end
end
=begin

As a library
In order to have good books to offer to the public
I would like to be able to have a collection of books stored in a file

As a library
In order to have good books to offer to the public
I would like to be able to allow individuals to check out a book

As a library
In order to make the books available to many individuals
I would like to set a return date on every check out
and I would like that date to be 1 month from checkout date

=end
