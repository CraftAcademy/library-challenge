require './lib/library'
require './lib/person'
require 'yaml'

describe Library do

#  let(:person) { instance_double('Person', name: 'Lisa', books: :item [0] ) }
#  subject { described_class.new(name: 'Lisa' )}

  it 'is expected to have a record of books on initialize' do
    expect(subject.books).not_to be nil
  end
end
