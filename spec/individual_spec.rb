=begin
require './lib/individual'

describe 'Individual' do
  subject { described_class.new(name: 'Gollum') }

  it 'has a name on initialize' do
    expect(subject.name).to eq 'Gollum'
  end
  it 'has an empty list of books on initialize' do
    expect(subject.books).to eq book_list[]
  end
end
