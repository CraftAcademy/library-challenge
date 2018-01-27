require './lib/client.rb'

describe Client do

  it 'creates a new client' do
    client = Client.new
    expect(client).to_not be nil
  end

  it 'adds checked out book to client\'s bookshelf' do
    subject.add_book('book')
    expect(subject.bookshelf).to eq ['book']
  end

  
end
