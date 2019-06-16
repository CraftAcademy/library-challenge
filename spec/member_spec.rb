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
    
        it 'shows available books.' do
            expect(subject.check_available_books(library)).not_to eq nil
        end

        it 'searches titles.' do
            search_term = "Pippi"
            expect(subject.search_titles(library, search_term)).not_to eq nil
        end

        describe 'borrows a book and' do
            it 'the book is not available.' do
                #book_num = 7
                #lib = Dewey.new
                #expect(subject.borrow(lib, member, book_num)).eq to 'Selected book is unavailable.'
            end

            it 'the book is available.' do
                #member = described_class.new(name: 'Max') 
                #book_num = 1
                #expect(subject.borrow(library, member, book_num)).to include "Your book"
            end
        end

    end
end