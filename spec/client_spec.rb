require './lib/client.rb'

describe Client do

  it 'creates a new client' do
    client = Client.new
    expect(client).to_not be nil
  end
end
