require './lib/library.rb'

describe Library do
  it 'should have a collection of books' do
    expect(subject.collection).to be_truthy
  end

  it 'should list books' do
    expected_output = "#{book[:item][:title]} by #{book[:item][:author]} (#{book[:item][:genre]})"
    expect().to eq expected_output
  end

  it 'should list books that are available' do
    list_available_books =
    expect()
  end

end
