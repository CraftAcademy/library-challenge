require './lib/library.rb'

describe Library do
  let(:person) { instance_double('Person') }

  it 'has a collection of books on initialize' do
    expect(subject.collection).not_to be nil
  end

  it 'person can see list of books' do
    expect()
  end
end
