require './lib/library.rb'

describe Library do

        #let(:book) {instance_double ('book',book_name: 'Pippi Långstrump')}
   

    it 'returns true if there is a list of books' do
        expect(subject.books_list).not_to be nil
    end

    it 'Can search for book by title' do
        expected_book = [{item: {title: 'Pippi Långstrump går ombord',author: 'Astrid Lindgren'}, available: true, return_date: nil }]
        expect(subject.search_by_title('går ombord')).to eq(expected_book)
    end

    it 'Can search for book by author' do
        expected_book = [{item: {title: "Pippi Långstrump", author: "Astrid Lindgren"}, available: true, return_date: nil}, 
        {item: {title: "Pippi Långstrump går ombord", author: "Astrid Lindgren"}, available: true, return_date: nil}]
        expect(subject.search_by_author('Astrid Lindgren')).to eq(expected_book)
    end

    it 'check books that are available' do
        expect(subject.available_books).to eq [{available: true}]
        
    end


end