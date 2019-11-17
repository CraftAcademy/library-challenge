require 'library.rb'

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
        expected_output = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}]
        expect(subject.search("Alfons och soldatpappan")).to eq expected_output
        end

        


    end
