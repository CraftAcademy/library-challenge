require './lib/keeper.rb'
require 'date'
require './lib/customer.rb'


describe Customer do
    let(:keeper) { Keeper.new }

    it 'has an attribute of rented books on initialize, that is an empty array' do
        expect(subject.rented_books).to eq []
    end

    # it 'upon checkout, customer will receive the book to his list' do
    #     title = "Big Fish"
    #     keeper.check_out(title, subject)
    #     book = keeper.list.detect { |hash| hash[:book][:title] == title }
    #     expect(subject.rented_books).to eq [book]

    # end

end