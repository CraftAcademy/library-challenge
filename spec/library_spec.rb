require './lib/library.rb'

describe Library do
  #initial testing to get us started
  it 'can create an instace of a library' do
    library = Library.new
    expect(library).to be_kind_of Library
  end

end
