require './lib/person.rb'

describe Person do

  it 'has a list of books' do
    expect(subject.list).not_to be nil
  end

  it 'knows due date' do
    expect(subject.list[0][:return_date]).not_to be nil
  end

end
