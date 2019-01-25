require './lib/library.rb'



describe Library do 
    it'is expected to have a collection of books on initialize' do
        expect(subject.book_collection).not_to be nil
    end

    it'is possible to browse the collection' do
        expect(subject.show_collection).to be_kind_of(Array)
    end
end