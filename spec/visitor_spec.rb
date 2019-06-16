require './lib/visitor.rb'

describe Visitor do

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
        expected_output = "You can borrow the book but fuck you if u ruin it"
        expect(subject.search("Skratta lagom! Sa pappa Åberg")).to eq expected_output
    end
end