require './lib/library.rb'
require 'date'

describe Library do
  
    it 'checks if on initialize book_list var is nil' do
        expect(subject.book_list).to be nil
    end

    describe 'can read file' do
        before(:each) do
            subject.read_book_list
        end
        describe 'read booklist before each' do

            it 'reads book.yml as an object' do
                expect(subject.book_list).not_to be nil
            end

            it 'can pull individual book from book_list' do
                expected_outcome = {:item=>{:title=>"Foundation", :author=>"Isaak Asimov"}, :available=>false, :return_date=>subject.thirty_days_later}
                expect(subject.pull_book({title: 'Foundation'})).to eq  expected_outcome
            end

            it 'returns error if no title is given to pull_book method' do        
                expect{ subject.pull_book }.to raise_error(RuntimeError, "Specify the title of book to pull")
            end
        

            it 'edits the avalibility value false and set return date' do
              subject.pull_book({title: 'Lord of the Rings'})
              subject.change_status
              expected_outcome = {:item=>{:title=>"Lord of the Rings", :author=>"J.R.R. Tolkien"}, :available=>false, :return_date=>subject.thirty_days_later}
              expect(subject.pulled_book).to eq expected_outcome
            end

            describe 'pull book foundatin and change status' do
                before(:each) do
                    subject.pull_book({title: 'Foundation'})
                    subject.change_status
                end
                describe 'edits and saves the book in to file' do
        

                    it 'edits the avalibility value to true and removes return date' do
                      expected_outcome = {:item=>{:title=>"Foundation", :author=>"Isaak Asimov"}, :available=>true, :return_date=>nil}
                      expect(subject.pulled_book).to eq expected_outcome
                    end
                
                    it 'saves changes from @pulled_book to @book_list' do
                        subject.pull_book({title: 'Foundation'})
                        expected_outcome = {:item=>{:title=>"Foundation", :author=>"Isaak Asimov"}, :available=>true, :return_date=>nil}
                        expect(subject.pulled_book).to eq expected_outcome
                    end
                
                    it 'rewrites a books.yml file with updated @book_list' do
                        subject.save_book_list
                        subject.read_book_list
                        subject.pull_book({title: 'Foundation'})
                        expected_outcome = {:item=>{:title=>"Foundation", :author=>"Isaak Asimov"}, :available=>true, :return_date=>nil}
                        expect(subject.pulled_book).to eq expected_outcome
                    end 
                end
            end
        end
    end

    after(:each) do
      book_list = YAML.load_file('./lib/books_original_state.yml')
      File.open('./lib/books.yml', 'w') { |file| file.write book_list.to_yaml }
    end

end