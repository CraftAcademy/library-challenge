require './lib/person.rb'
require './lib/library.rb'

describe Person do
  let(:library) {Library.new}
# As an individual
# In order to get my hands on a good book
# I would like to see a list of books currently available in the library
# with information about the title and author
  it 'is expected to see a list of books currently available in the library' do
    expect(library.book_list).not_to be_nil
  end

# As an individual
# In order to avoid awkward moments at the library
# I would like to know when my book is supposed to be returned

end
