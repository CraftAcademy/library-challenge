# 1As a library
# 2In order to have  good  books to offer to thepublic
# 3I would  like to be able to have a collection  of books  stored  in a file

# 1As a library
# 2In order to have  good  books to offer to thepublic
# 3I would  like to be able to allow  individuals  to check  out a book

# 1As a library
# 2In order to make  the  books  available  to many  individuals
# 3I would  like to set areturndate on every  check  out
# 4and I would  like  that  date to be 1 month  from  checkout  date
require './lib/library.rb'

describe library do
    let(:person) {instance_double('Person', name: 'Bob')}
    
    # before do
    #     allow(person).to receive(:collection)
    # end

    it 'person can view books in collection on initialise' do
        expect(:collection).to be true 
    end
end


# it 'check book available in collection' do
#     book.available = true 
# end