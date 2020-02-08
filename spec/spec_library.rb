require './lib/library.rb'

describe Library do
    subject {described_class.new}

    it 'Library collection books is not empty'do
        expect(subject.collection_books).not_to be nil
    end

    it 'Gets book through title/author' do
        expect(subject.collection_books.title).to be 'Alfons och soldatpappan'
    end



end