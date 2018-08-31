require './lib/library.rb'
require 'yaml'

describe Library do

it "has a collection of books" do
    expect(subject.list_of_books).not_to be_empty
    #subject.(then)response that we want
end

it "allows to check all available books" do
    expect(subject.book_available).to be true
end

# it "should allow available book for check-out"

#when not available
 #   it should respond with book_not_available
#end



#it "Books need to be returned after 1 month" do
#end

end
