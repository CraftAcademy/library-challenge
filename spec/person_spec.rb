require './lib/person.rb'

describe Person do
  let(:library) {double('Library')}


  it 'is by a library' do
      expect(library).not_to be nil
  end

  it 'has a list of books' do
    expect(subject.list).not_to be nil
  end

  it 'has title' do
    expect(subject.list[0][:item][:title]).not_to be nil
  end

  it 'has author' do
    expect(subject.list[0][:item][:author]).not_to be nil
  end

  it 'knows due date' do
    expect(subject.list[0][:return_date]).not_to be nil
  end


end
