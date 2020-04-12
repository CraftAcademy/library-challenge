require './lib/book.rb'
require './lib/person.rb'
require './lib/library.rb'
require 'date'
describe Person do
    subject { described_class.new({name: "Arnold"})}
    let(:lib) {Library.new}
    let(:book1)  {Book.new({item: {title: 'Book1', author: 'Author1', category: 'Cat1'},library:lib})}
    let(:book2)  {Book.new({item: {title: 'Book2', author: 'Author2', category: 'Cat2'},library:lib})}

    it 'cannot exist without a name' do
    #   As a library owner
    #   In order to make sure I can get my books back
    #   I want to keep the personal details of the loanees
        expect{ described_class.new}.to raise_error 'Person must have a name'        
    end

    it 'does not have any loaned book on init' do
        expect( described_class.new({name: "Bob"}).receipts).to eq []
    end

    it 'can check what books it has loaned,return them,remove correct receipt' do
        # As a visitor
        # In order to check when to return loaned books
        # I need to see list/receipts of my loans
        book1.checkout(subject)
        book2.checkout(subject)
        expect( subject.receipts ).to be_a_kind_of(Array)
        expect( subject.receipts.length ).to eq 2
        expect( subject.receipts[0] ).to be_a_kind_of(Hash)
        book1.return_book
        expect( subject.receipts.length ).to eq 1
        expect( subject.receipts[0][:book]).to eq book2
    end

    



end