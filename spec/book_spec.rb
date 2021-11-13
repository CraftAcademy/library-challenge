require './lib/book.rb'

describe Book do

  subject { described_class.new(title: "1984", author: "George Orwell") }

  it 'is expected to have title "1984" initialized' do
    expect(subject.title).to eq '1984'
  end

  it 'is expected to have author "George Orwell" initialized' do
    expect(subject.author).to eq 'George Orwell'
  end

end
