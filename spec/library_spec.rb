   require "./lib/library.rb"
   
   describe Library do
    subject {described_class.new}

it "should be an empty list of books at first" do
    expect(subject.library_books).to be_empty
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