require './lib/library'

describe Library do

  it 'it is expected to display a list of books' do
    expect(subject.books).not_to be_empty
  end
end
