require './lib/library.rb'

describe Library do
    subject {described_class.new}

    it 'should have a collection of books when initialized' do
    expect(subject.collection).to be_truthy
    end

    it 'should be possible to display what books are available' do
    expect(subject.show_available_books).to be_truthy
    end

    it 'should display correct amount of available books' do
    expect(subject.show_available_books.length).to eq 4
    end
    
    it 'should be able to display all books with a return date' do
    expect(subject.show_books_with_return_dates.length).to eq 1
    end


end



