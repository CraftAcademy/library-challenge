require './lib/person.rb'

describe Person do
    subject {described_class.new}
    
    it 'should have a name when initialized' do
        subject.name = "Boa"
        expect(subject.name).to eq "Boa"
    end

    it 'should be able to view all books that are available' do
    expect(subject.show_books.length).to eq 4
    end

    it 'should be able to search for a book based on its title'do
    end

    it 'should be able to checkout a book, and add it to his/her list of borrowed books' do
    end

end