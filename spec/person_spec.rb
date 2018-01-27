require './lib/person.rb'

describe Person do

  it 'person should have bookshelf' do
      expect(subject).to respond_to(:bookshelf)
  end

  it 'can checkout a book' do
    expect(subject.checkout('Alfons och soldatpappan')).not_to be_nil
  end

end
