require './lib/library.rb'

describe Library do

        #let(:book) {instance_double ('book',book_name: 'Pippi Långstrump')}
   

    it 'returns true if there is a list of books' do
        expect(subject.books_list).not_to be nil
    end

    it 'Can search for book by title' do
        expected_book = [{item: {title: 'Pippi Långstrump går ombord',author: 'Astrid Lindgren'}, available: true, return_date: nil }]
        expect(subject.search_by_title('Pippi Långstrump går ombord')).to eq(expected_book)
    end

    it 'Can search for book by author' do
        expected_book = [{item: {title: "Pippi Långstrump", author: "Astrid Lindgren"}, available: true, return_date: nil}, 
        {item: {title: "Pippi Långstrump går ombord", author: "Astrid Lindgren"}, available: true, return_date: nil}]
        expect(subject.search_by_author('Astrid Lindgren')).to eq(expected_book)
    end

    it 'list of available books' do
        expect(subject.available_books).to be_truthy
        
    end

    it 'change book to unavailable ' do
        subject.set_book_unvailable(2)
        expect(subject.books_list[2][:available]).to eq false
    end

end