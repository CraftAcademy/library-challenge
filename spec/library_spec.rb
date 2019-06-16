   require "./lib/library.rb"
   
   describe Library do
    subject {described_class.new}


it "should have 5 books after loading lib/data.yml" do
expect(subject.library_books.size()).to eq 5
end

it "should find books by title" do
expect(subject.find_title("Osynligt med Alfons")).not_to eq nil
end

it "should find books by author" do
    expect(subject.find_title("Gunilla Bergström")).not_to eq nil
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