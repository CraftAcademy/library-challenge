require './lib/user.rb'
require 'date'

describe User do

    it 'creates a user with no checked-out books' do
        expect(subject.books_in_posession).to be_empty
    end

    #it 'populates books posession list with newly checked out books' do
    #    expect(subject.borrowed_books).to eq 
    #end

    let(:library) { Library.new }
    it 'checks out book from library, storing its title, author and return date' do
        expected_output = ["Alfons och soldatpappan - Gunilla Bergström (Return date: #{Date.today.next_month(1).strftime("%Y-%m-%d")})"]
        expect(subject.checkout_book(library, "Alfons och soldatpappan")).to eq expected_output
    end
end