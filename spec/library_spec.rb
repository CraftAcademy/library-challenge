require './lib/library.rb'



describe Library do 
    it'is expected to have a collection of books on initialize' do
        expect(subject.book_collection).not_to be nil
    end

    it'is possible to browse the collection' do
        expect(subject.show_collection).to be_kind_of(Array)
    end

    it'is possible to search for available books' do 
        expect(subject.available_books).to be_kind_of(Array)
    end
    

it'is possible to check return date' do
    expect(subject.check_return_date('Skratta lagom! Sa pappa Åberg')).to eq ("2016-05-25")
end

end