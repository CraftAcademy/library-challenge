require './lib/library.rb'

describe Person do

  it "allows to check that a book is available" do
    expect(subject.availability("Alfons och soldatpappan", "Gunilla Bergström")).to be true
  end
end

=begin
As an individual
In order to get my hands on a good book
I would like to see a list of books currently available in the library
with information about the title and author

As an individual
In order to avoid awkward moments at the library
I would like to know when my book is supposed to be returned

=end
