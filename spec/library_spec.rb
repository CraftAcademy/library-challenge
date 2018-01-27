require './lib/library.rb'
require 'date'

describe Library do

  it "has a list of books available" do
    expect(subject.booklist).to be_an_instance_of(Array)
  end

  it "allows to check that a book is available" do
    expect(subject.availability("Alfons och soldatpappan", "Gunilla Bergström")).to be true
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
