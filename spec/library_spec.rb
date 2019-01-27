require './lib/library.rb'

describe Library do
    let(:person) {instance_double('Person, name: 'Amanda', rented_book: 'Clean Code')}

    it 'have books in library' do
        expect(subject.collection).not_to eq nil
    end

    it 'can search a book in the database' do
        expect(subject.select_book("PC")).not_to eq nil)
    end

    it 'can show which books are available' do
        expect(subject.show_available_books).
    
end
