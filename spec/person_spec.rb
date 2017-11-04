require './lib/person'
require 'yaml'

describe Person do

  let(:library) { instance_double('Library')}
  let(:list) {double('collection')}
  subject {described_class.new(name: 'India')}

  it 'has name on initialize' do
    expect(subject.name).not_to be nil
  end
  it 'access the book list' do
    allow(library).to receive(:book_list).and_return('book list')
    expect(subject.get_book_list(library, list)).to eq 'book list'
  end
end
