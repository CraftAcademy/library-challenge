require './lib/library'

describe Library do
  it 'has a collection of books on intialize' do
    expect(subject.collection).not_to be nil
  end
end
