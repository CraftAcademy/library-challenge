require './lib/person.rb'

describe Person do

  subject { described_class.new }

  it 'person should have bookshelf' do
      expect(subject).to respond_to(:bookshelf)
  end

  it 'clears a persons bookshelf' do
    expect(subject.clear_bookshelf).to eq []
  end

end
