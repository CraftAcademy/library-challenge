require './lib/library'

describe Library do

  it 'it is expected to display a list of books' do
    expect(subject.books).not_to be_empty
  end

  it 'is expected to display a list of books currently available' do
    expect(subject.books).to include
  end

end
