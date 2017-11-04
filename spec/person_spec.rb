require './lib/person'

describe 'Person' do

  subject { described_class.new(name: 'Lisa') }

  it 'should have a name' do
    expect(subject).to respond_to(:name)
  end

  it 'should have a :books attribute with value of nil upon initialize' do
    expect(subject.books).to eq nil
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
