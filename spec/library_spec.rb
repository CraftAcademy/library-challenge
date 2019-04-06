

describe 'library' do

    it 'Whole collection of books in library' do
        expect(subject.collection.books).to eq 5
    end
end

