require './lib/library.rb'


describe Library do

    subject {described_class.new}
    let(:person) { instance_double('Person', name: 'Boa')}

    it 'should have a collection of books when initialized' do
        expect(subject.collection).to be_truthy
    end

    it 'should be possible to display what books are available' do
        expect(subject.show_available_books).to be_truthy
    end

    it 'should display correct amount of available books' do
        expect(subject.show_available_books.length).to eq 4
    end
    
    it 'should be able to display all books that are NOT available' do
        expect(subject.show_non_available_books.length).to eq 1
    end

    it 'should be able to select a book by title' do
        expected_output = [{:item=>{:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"},:available=>false, :return_date=>"2019-05-25", :borrowed_by=>nil}]
        expect(subject.select_book_by_title("Skratta lagom! Sa pappa Åberg")).to eq expected_output
    end

    it 'should be able to make it possible to checkout a book, and update the item availability' do
        subject.checkout_book(0, 'Boa')
        expect(subject.collection[0][:available]).to eq false
        subject.collection[0][:available] = true
        subject.collection[0][:return_date] = nil
        subject.collection[0][:borrowed_by] = nil
        subject.save_updates
    end

    it 'should update the return date when book is checked out' do
        subject.checkout_book(0, 'Boa')
        new_date = subject.collection[0][:return_date]
        expect(subject.collection[0][:return_date]).to eq new_date
        subject.collection[0][:available] = true
        subject.collection[0][:return_date] = nil
        subject.collection[0][:borrowed_by] = nil
        subject.save_updates
    end

    it 'should update the database with the name of the person who borrowed the book' do
        subject.checkout_book(0, 'Boa')
        expect(subject.collection[0][:borrowed_by]).to eq "Boa"
        subject.collection[0][:available] = true
        subject.collection[0][:return_date] = nil
        subject.collection[0][:borrowed_by] = nil
        subject.save_updates
    end

end


