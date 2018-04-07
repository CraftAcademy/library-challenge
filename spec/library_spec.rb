require './lib/library.rb'

describe Library do

  it 'is an array' do
    expect(subject.book_list).to be_instance_of(Array)
  end

  it 'return a collection of 1 or more books' do
    expect(subject.book_list.length).to be > 0
  end

end
