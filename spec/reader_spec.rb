require './lib/books.rb'

describe Books do
    subject { Books.new }

    it "is return the books title of Four Hour Work Week" do
        expect(subject.title).to eq "Four Hour Work Week"    
    end

    it "is expected to return the author of Tim Ferriss" do
            expect(subject.author).to eq "Tim Ferriss"
    end

    it "is expected to have the show the return date of 30 days from today" do
        borrowing_period = 30
        end_date = Date.today.next_day(borrowing_period)  
        expect(subject.return_date).to eq end_date.strftime('%d/%m/%y')
    end
        
end


# Test section 1 
# it is expect to tell Max the books he has borrowed 
# it is expect to tell Mas when borrowed books are due to be returned
# it is exepcted to show Max which books are available

# Test section 2
# Check out a books an update the availability, due date and borrower


# Tesct section 3
#it is expected to show the library the books that they have availbale. 


