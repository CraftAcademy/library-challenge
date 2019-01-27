require './lib/library.rb'

describe Library do

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
    
end
