require './lib/library.rb'

describe Library do
    let(:person) {instance_double('Person', name: 'Amanda', book: 'Clean Code')}

    
    it 'have books in library' do
        expect(subject.collection).not_to eq nil
    end

    it 'can search a book in the database' do
        expect(subject.select_book("PC")).not_to eq nil
    end

    it 'can show which books are available' do
        expect(subject.show_available_books).not_to eq nil
    end

    it 'can show which books are checked out' do
        expect(subject.show_unavailable_books).not_to eq nil
    end

    it 'can search for a specific book title' do
        expect(subject.select_book("Clean Code")).not_to eq nil
    end

    describe '#checkout_book' do
        it 'can checkout a book after searching for its title' do
            expected_outcome = :available = false
            expect(subject.collection("Clean Code")).to eq expected_outcome
        end
    end
end
