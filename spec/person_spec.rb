require './lib/person.rb'

describe Person do
  let(:library) { instance_double('Library',
    book_list:[{title:'Veg Recipes', author:'Tan Li'},
                {title:'Thinking in C++', author:'Bruce Eckel'}])}

# As an individual
# In order to get my hands on a good book
# I would like to see a list of books currently available in the library
# with information about the title and author
  it 'is expected to see a list of books currently available in the library' do
    expect(library.book_list).not_to be_empty
  end

# As an individual
# In order to borrow a book
# I must create an account in the library
  it 'is expected to register in the library' do
    expect(subject.register('Yan')).to be_truthy
  end

# As an individual
# In order to avoid awkward moments at the library
# I would like to know when my book is supposed to be returned

end
