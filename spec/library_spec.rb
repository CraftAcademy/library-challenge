require './lib/library.rb'

describe Library do
    subject {described_class.new}
    let(:person) { instance_double('Person')}

    it 'should have a collection of books when initialized' do
    expect(subject.collection).to be_truthy
    end

    it 'should be possible to display what books are available' do
    expect(subject.show_available_books).to be_truthy
    end

    it 'should display correct amount of available books' do
    expect(subject.show_available_books.length).to eq 4
    end
    
    it 'should be able to display all books with a return date - non available books' do
    expect(subject.show_non_available_books.length).to eq 1
    end

    it 'should be able to select a book by title' do
    expect(subject.select_book("Skratta lagom! Sa pappa Åberg")).to be_truthy
    end
    
end



