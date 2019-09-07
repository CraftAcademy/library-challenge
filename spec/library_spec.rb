require'./lib/library.rb'

describe Library do
    it 'shows a list of which books are in the library' do
        expect(subject.booklist).not_to be nil
    end
end