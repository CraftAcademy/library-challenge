require './lib/user.rb'

describe User do
  it 'is expected to have no books on initialize' do
    expect(subject.books).to eq nil
  end
end
