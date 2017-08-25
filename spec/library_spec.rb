require './lib/library.rb'

describe Library do
  it 'should have a collection of books' do
    expect(subject.collection).to be_truthy
  end

  it 'should list if books are available/unavailable' do
    expect(subject.menu).to be_truthy
  end

end
