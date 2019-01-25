require './lib/library.rb'
require 'date'



describe Library do
    let(:visitor) {instance_double('Visitor',name: 'Viktor', books: [])}
   
        it'is expected to have a collection of books on initialize' do
            expect(subject.book_collection).not_to be nil
        end

        it'is possible to browse the collection' do
            expect(subject.show_collection).to be_kind_of(Array)
        end

        it'is possible to search for available books' do 
            expect(subject.available_books).to be_kind_of(Array)
        end
        
        it'is possible to check return date' do
            expect(subject.check_return_date('Skratta lagom! Sa pappa Åberg')).to eq ("2016-05-25")
        end


    describe 'can check out books if' do
        
        it'is available' do
            expected_output = "Thank you! Check out complete! Return date: #{Date.today.next_month.strftime('%Y-%m-%d')}"
            expect(subject.check_out('Pippi Långstrump')).to eq expected_output
        end    
    end
    
    describe 'cannot check out book if' do   
        
        it'is unavailable ' do
            expected_output = "We're sorry! That book is currently unavailable"
            expect(subject.check_out('Skratta lagom! Sa pappa Åberg')).to eq expected_output
        end
    end 
    
    describe 'can return books' do
        
        it'is possible to return books' do
            expected_output = "Thank you! The book is Returned"
            expect(subject.return_book('Skratta lagom! Sa pappa Åberg')).to eq expected_output
        end
    end
end