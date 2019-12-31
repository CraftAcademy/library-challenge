require './lib/user.rb'
require 'date'

describe User do

    it 'creates a user with no checked-out books' do
        expect(subject.books_in_posession).to be_empty
    end

    let(:library) { Library.new }
    it 'checks out book from library, storing its title, author and return date' do
        expected_output = ["Alfons och soldatpappan - Gunilla Bergström (Return date: #{Date.today.next_month(1).strftime("%Y-%m-%d")})"]
        subject.checkout_book(library, "Alfons och soldatpappan")
        expect(subject.books_in_posession).to eq expected_output
    end
end