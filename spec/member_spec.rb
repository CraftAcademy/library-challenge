require 'date'
require './lib/member.rb'

describe Member do
    
    it 'provides member name.' do
        member = described_class.new(name: 'Max') 
        expect(member.name).to eq 'Max'
    end

    describe 'of the available books in the collection of the selected library,' do
        subject { described_class.new(name: 'Max') }
        library = Dewey.new
    
        it 'checks showing of available books.' do
            expect(subject.check_available_books(library)).not_to eq nil
        end

        it 'checks searching of titles.' do
            search_term = "Pippi"
            expect(subject.search_titles(library, search_term)).not_to eq nil
        end

        describe 'borrows a book and' do
            subject { described_class.new(name: 'Sasha')}
            it 'checks when the book does not exist.' do
                book_num = 10
                expected_value = 'Selected book does not exist.'
                expect(subject.borrow(library, subject, book_num)).to eq expected_value
            end

            it 'checks when the book is already borrowed by the user.' do
                book_num=2
                expected_value = 'You already have this book.'
                expect(subject.borrow(library, subject, book_num)).to eq expected_value
            end

            it 'checks when the book is unavailable.' do
                book_num=5
                expected_value = 'This book is checked out by someone else.'
                expect(subject.borrow(library, subject, book_num)).to eq expected_value
            end

            it 'the book is available.' do
                member = described_class.new(name: 'Danni') 
                book_num = 1
                expect(subject.borrow(library, member, book_num)).to include "You now have"
            end
        end

    end
end