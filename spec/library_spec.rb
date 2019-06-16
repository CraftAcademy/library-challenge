   require "./lib/library.rb"
   
   describe Library do
    subject {described_class.new}

it "should have a list of books when initialized" do
    expect(subject.library_books).not_to be_empty
end

it "should have 5 books after loading lib/data.yml" do
expect(subject.library_books.size()).to eq 5
end

it "should find books by title" do
expect(subject.find_by_title("Osynligt med Alfons")).not_to eq nil
end

it "should find books by author" do
    expect(subject.find_by_title("Gunilla Bergström")).not_to eq nil
end

it "should be able to check out books" do
    expected_output = {
      item: [
      title: "Osynligt med Alfons",
      author: "Gunilla Bergström"],
      available: false,
      return_date: Date.today >> 1,
    }
    expect(subject.check_out_book("Osynligt med Alfons")).to eq expected_output
end

it "should set due dates" do 
    subject.check_out_book("Osynligt med Alfons")
    expect(subject.return_date).to eq "2019-08-17"
end

it "should set to unavailable when checking out" do 
    subject.check_out_book("Osynligt med Alfons")
    expect(subject.available).to eq false
end

it "should give confirmations when check in/out" do
end

it "should add books" do
end

it "should write to file" do
end
   
end
   
   
   #booklist should be here
    #search for book by title/author
    #due date for checked out books
    #set due dates
    #confirmation
    #add books 
    #read from file
    #write to file

# - Add books to list
# - Access book list
# - Search for book title/author
# - See book status
# - Set due date on checked out books
# - See book due dates
# - Check in/out confirmations