require './lib/person.rb'
require './lib/library.rb'
require 'date'
require 'yaml'

describe Person do
    attr_accessor :list_books

    let(:library) {instance_double('library', collection: YAML.load_file('./lib/books.yml'))}
    let(:list) {instance_double('book_list')}
    
    it 'is expected to have a :name on initialize' do
        expect(:name).not_to be(nil)
    end
    
    it 'returns all books that are available in the library' do
        allow(library).to receive(:books_available).and_return('list of available books')
        expect(subject.list_available_books(library, list)).to eq 'list of available books'
    end
end

   