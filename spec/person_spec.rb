require './lib/person'

describe Person do

  subject { described_class.new(name: 'Lisa') }

#  it 'should have a name' do
#    expect(subject).to respond_to(:name)
#  end

  it 'is expected to have a :name on initialize' do
    expect(subject.name).not_to be nil
  end

  xit 'is expected to raise error if no name is set' do
    expect { described_class.new }.to raise_error 'A name is required'
  end

  xit 'should have a :books attribute with a collection of books upon initialize' do
    expect(subject.books).not_to be_empty
  end

=begin
  it 'can create an Account' do
    before { subject.create_account }
  end

  it 'can manage books record' do
    let (:books) { Library.new }
    before { subject.create_account }
  end
=end

end
