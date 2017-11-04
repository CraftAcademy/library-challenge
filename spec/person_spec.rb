require './lib/person.rb'

describe Person do
  subject { described_class.new(name: 'Scott')}

  it 'is expected to raise error if no name is filled in on initialize' do
    expect { described_class.new }.to raise_error 'Name is required'
  end

  it 'is expected to set books to empty array on initialize' do
    expect(subject.books).to eq Array.new
  end

  it 'is expected to set library to nil on initialize' do
    expect(subject.library).to eq nil
  end


end
