require './lib/books.rb'
require 'date'
require 'yaml'

    #describe collection do 
     #   subject {collection.new}

    #it "is return the books title of Four Hour Work Week" do
     #   collection.detect { |obj| obj[:item][:author] == "Tim Ferriss"  }  
    #end

    describe Books do
        #let (:) { Books.new }

        it 'is epected to returns true if there are books in the library database' do
            expect(subject.details).not_to be nil
        end

        it 'is is expected to return true of there books showing as available in the the database' do
            expect(subject.available_books).to be_truthy
        end

        it "is expected return the book details of Four Hour Work Week and" do
            expected_book = {
                author: 'Tim Ferriss', 
                title: 'The Four Hour Work Week',
                available: true, 
                return_date: nil,
                borrower: nil,
             }
            expect(subject.search_by_title('Tim Ferriss')).to eq(expected_book)
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


