require './lib/person.rb'

describe Person do

  it 'has a list of books on initialize' do
    expect(subject.books).to be_kind_of Array
  end

  it 'should be able to return books to the library' do
    expected_output = {item: {title: "Skratta lagom! Sa pappa Åberg", author: "Gunilla Bergström"}, available: false, return_date: '' }
    expect(subject.perform_returnbook('Skratta lagom! Sa pappa Åberg')).to eq expected_output
  end

  it 'should be able to borrow books from library' do
    expected_output = {item: {title: "Skratta lagom! Sa pappa Åberg", author: "Gunilla Bergström"}, available: true, return_date: Date.today + 30 }
    expect(subject.perform_borrow('Skratta lagom! Sa pappa Åberg')).to eq expected_output
  end
end
