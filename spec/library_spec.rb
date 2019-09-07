require './lib/library.rb'

describe Library do

  it 'responds to #books' do 
    expect(subject).to respond_to :books
  end

    it 'has #books as an Array' do 
    expect(subject.books).to be_a Array
  end


end