require './lib/library'
require 'date'

describe Library do

  #let(:book) {instance_double(title: 'The one thing', author: 'Gary Keller', date: '17/08/25', return_date: '17/09/25') }

  it 'is expected to show a list of books currently available in the library' do
     expect(subject.show_books).to be_an_instance_of Array
  end

  it 'is expected to search books entering a keyword' do
    expect(subject.search('thing')).to be_an_instance_of Array
  end
end
