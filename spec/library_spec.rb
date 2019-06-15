   require "./lib/library.rb"
   
   describe Library do
    subject {described_class.new}

it "should be an empty list of books at first" do
    expect(subject.library_books).to be_empty
end

it "should have 5 books after loading lib/data.yml" do
subject.read_books_from_file("./lib/data.yml")
expect(subject.library_books.size()).to eq 5
end

it "should find a certain title in the list" do
expect(subject.find_title("Osynligt med Alfons")).not_to eq nil
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