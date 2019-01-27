require './lib/library.rb'

describe Library do
    it 'have books in library' do
        expect(subject.collection).not_to eq nil
    end

    it 'can search a book in the database' do
        expect(subject.select_book("PC")).not_to eq nil)
    end

    
end
