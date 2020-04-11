require './lib/book.rb'
require './lib/person.rb'
require 'date'
describe Person do
    subject { described_class.new({name: "Arnold"})}
    book1 = Book.new(item: {title: 'Book1', author: 'Author1', category: 'Cat1'})
    book2 = Book.new(item: {title: 'Book2', author: 'Author2', category: 'Cat2'})

    it 'cannot exist without a name' do
        expect{ described_class.new}.to raise_error 'Person must have a name'        
    end

    it 'does not have any loaned book on init' do
        expect( described_class.new({name: "Bob"}).receipts).to eq []
    end

    it 'can check what books it has loaned' do
        book1.checkout(subject)
        book2.checkout(subject)
        expect( subject.receipts ).to be_a_kind_of(Array)
        expect( subject.receipts.length ).to eq 2
        expect( subject.receipts[0] ).to be_a_kind_of(Hash)
    end

end