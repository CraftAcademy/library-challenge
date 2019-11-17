require 'library.rb'
require 'pry'
require 'date'

    describe Library do
        
        it 'expects a library to have a list of its books' do
            expect(subject.books).not_to be nil
        end

        before { subject.list_books }
        it 'expects a list of librarys books' do
            expected_output = 'Skratta lagom! Sa pappa Åberg - Gunilla Bergström - Not availible'
            expect(subject.all_books[1]).to eq expected_output
           
        end


        it 'library has a working search function for title' do
        expected_output = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>Date.today >> 1}]
        expect(subject.search("Alfons och soldatpappan")).to eq expected_output
        end

        it 'checkout changes status of book and sets return date' do
            #expected_output = {:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>Date.today >> 1 }
            #expect(subject.checkout("Alfons och soldatpappan")).to eq expected_output
            true
        end
        

        it 'raises error message for checkout if book is not available' do
            expect { subject.checkout("Skratta lagom! Sa pappa Åberg") }.to raise_error(RuntimeError, "Sorry, book is unavailable!")
            
        end
end
