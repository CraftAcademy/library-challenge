require './lib/library.rb'
require 'pry'

describe Library do
    subject {described_class.new}

    it 'Library collection books is not empty'do
    expect(subject.collection_books).not_to be nil
    end

    it 'Gets book through title' do
    expect(subject.collection_books[0][:item][:title]).to eq 'Alfons och soldatpappan'
    end

end