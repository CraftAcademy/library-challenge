require './lib/person'

describe Person do

  subject { described_class.new(name: 'Mariza') }

  it 'needs to indentify individuals by name' do
    expect(subject.name).not_to be nil
  end

  it 'raises an error message if no name matches' do
    expect{ described_class.new }.to raise_error 'You need an account to rent books'
  end

  it 'has an empty array books on initialize' do
    expect(subject.books).to eq []
  end

end
