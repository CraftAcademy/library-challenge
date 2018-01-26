require './lib/library.rb'

describe Library do

  it 'creates a new library' do
    library = Library.new
    expect(library).to_not be nil
  end

end
