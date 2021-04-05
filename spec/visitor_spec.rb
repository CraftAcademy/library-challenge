require './lib/visitor.rb'
require './lib/library.rb'
require 'date'

describe Visitor do
    expected_return_date = Date.today.next_day(30).strftime('%d-%m-%y')    
    library = Library.new
    subject { described_class.new({library: library}) }

    it 'can check what books are available for rent' do
        expected_outcome = [
            {:available=>true, :item=>{:author=>"J.R.R. Tolkien", :title=>"Lord of the Rings"}, :return_date=>nil},
            {:available=>true, :item=>{:author=>"Eric Nylund", :title=>"Halo: Fall of Reach"}, :return_date=>nil},
            {:available=>true, :item=>{:author=>"E.L. James", :title=>"Fifty Shades of Grey"}, :return_date=>nil}
        ]
        expect(subject.see_available).to eq expected_outcome
    end

    it 'Can not rent the book' do
        subject.library.read_book_list
       expect{subject.rent_the_book({title: 'Foundation'})}.to raise_error 'Book is unavailable'
    end

    describe 'rents LoR' do
        before(:each) do
            subject.library.read_book_list
            subject.rent_the_book({title: 'Lord of the Rings'})
        end
        describe 'test renting and returning the book' do
   
            it 'can rent the book' do                
                subject.library.read_book_list
                subject.library.pull_book({title: 'Lord of the Rings'})
                expected_outcome = {:item=>{:title=>"Lord of the Rings",        :author=>"J.R.R. Tolkien"}, :available=>false,      :return_date=>expected_return_date}
                expect(subject.library.pulled_book).to eq expected_outcome
            end

            it 'sends a recipet' do
                expected_outcome = {title: 'Lord of the Rings',  return_date: expected_return_date, date: Date.today.strftime('%d-%m-%y')}
                expect(subject.receipt).to eq expected_outcome
            end  

            it 'checks for the list of currently owned books' do
                subject.rent_the_book({title: 'Halo: Fall of Reach'})
                expected_outcome = [
                    {title: 'Lord of the Rings',    :return_date=>expected_return_date},
                    {title: 'Halo: Fall of Reach',  :return_date=>expected_return_date}
                ]
                expect(subject.books_in_possesion).to eq expected_outcome
            end
            it 'can\'t return the book' do
                expect{subject.return_the_book({title: 'Halo: Fall of Reach'})}.to raise_error "This book is already returned please contact staff" 
            end

            it 'can return the book' do
                subject.return_the_book({title: 'Lord of the Rings'})
                expect(subject.books_in_possesion).to eq []
            end

            it 'cheks if file is changed when book is returned' do
                subject.return_the_book({title: 'Lord of the Rings'})
                subject.library.read_book_list
                subject.library.pull_book({title: 'Lord of the Rings'})
                expected_outcome = {:item=>{:title=>"Lord of the Rings", :author=>"J.R.R. Tolkien"}, :available=>true,  :return_date=>nil}
                expect(subject.library.pulled_book).to eq expected_outcome
            end
        end
    end

    after(:each) do
        book_list = YAML.load_file('./lib/books_original_state.yml')
        File.open('./lib/books.yml', 'w') { |file| file.write book_list.to_yaml }
    end
    
end