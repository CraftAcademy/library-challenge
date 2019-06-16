require './lib/visitor.rb'

describe Visitor do
    let(:library) { class_double('library') }

    it 'can borrow books if visitor has a name' do
        expect(subject.name).to eq @name
    end

    it 'is active on initialize' do
        expect(subject.visitor_account_status).to eq :active
    end

    # it 'is deactivated if a book not returned in time' do
    #     expect(subject.visitor_account_status).to eq :deactivated
    # end

    it  "a visitor must be able to search for a book to see if its available" do
        expected_output = "It's your lucky day! This book is in our library."
        expect(subject.search("Skratta lagom! Sa pappa Åberg")).to eq expected_output
    end

    it "if the book isn't available the visitor must get a message returning that it is unavailable" do
        expected_output = "Unfortunally we don't have that book."
        expect(subject.search("Lord Of The Rings")).to eq expected_output
    end

    it "when the visitor finds a book, he/she must be able to borrow it" do
        expected_output = "You have just borrowed an awesome book! Please don't forget to return it."
        expect(subject.borrow_book("Skratta lagom! Sa pappa Åberg")).to eq expected_output 
    end
end