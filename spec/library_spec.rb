require './lib/library.rb'

describe Library do
  it 'should have a collection of books' do
    expect(subject.collection).to be_truthy
  end

  it 'should list if books are available/unavailable' do
    list = subject.menu
    expect(list).to eq list_books
  end

end
