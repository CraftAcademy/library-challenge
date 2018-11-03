require './lib/library.rb'
require 'pry'

describe Library do
    let(:person) {instance_double('Person', name: 'Thomas', rented_book: 'Harry Potter')}

    it 'expect not to update if database is empty' do
        subject.update_collection
        expect(subject.collection).to eq []
    end

    describe 'add book' do
        before do
            subject.add_book({title:'Harry Potter', author: 'JK Rowling'})
        end

        it 'expect to add a book with title, author, availability, and empty return date ' do
            expect(subject.collection).to eq ([{title:'Harry Potter', author: 'JK Rowling', status: 'available', checked_out_to: nil, return_date: nil}])
        end

        it 'expect to see available books with available_books method' do
            subject.check_available_books
            expect(subject.available_books).to eq ([{title:'Harry Potter', author: 'JK Rowling'}])
        end

        it 'expect to update the collection with update method' do
            subject.collection = nil
            subject.update_collection
            expect(subject.collection).to eq ([{title:'Harry Potter', author: 'JK Rowling', status: 'available', checked_out_to: nil, return_date: nil}])
        end
        describe 'check-out book' do
            before do
                subject.checkout_book("Harry Potter", 'Thomas')
            end
            it 'expect to change status to checked-out' do
                expect(subject.collection[0][:status]).to eq 'checked-out'
            end

            it 'expect to change the return date to 30 days from now' do
                expect(subject.collection[0][:return_date]).to eq Date.today + 30
            end

            it 'expect checked_out_to to be name' do
                expect(subject.collection[0][:checked_out_to]).to eq 'Thomas'
            end
        end
    end
end
