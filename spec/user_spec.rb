require './lib/user.rb'

describe User do
  it 'is expected to have no books on initialize' do
    expect(subject.books).to match_array([])
  end

  it 'is expected to have no name on initialize' do
    expect(subject.name).to be_nil
  end
end
