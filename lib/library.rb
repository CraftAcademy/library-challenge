require './lib/libary'
require './lib/person'
require 'yaml'

describe Library do

  let(:person) { instance_double('Person', name: 'Lisa' )}
  subject { described class.new(name: 'Lisa') }

  it 'is expected to have a record of books on initialize' do
    expect(subject.books).not_to be_empty
  end
end
