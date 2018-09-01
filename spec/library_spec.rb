require './lib/library.rb'
require './lib/books.yml'
require 'date'

describe library do
    let(:library) {instance_double(collection: YAML.load_file('./lib/books.yml') )}
    subject {describe class.new({library: collection})}
    
    before do
        allow(library).to receive(collection)
    end

    it 'person can view books in collection on initialise' do
        expect(subject.collection).to be @collection
    end
end


# it 'check book available in collection' do
#     book.available = true 
# end