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

  it 'should print out clients bookshelf' do
    subject.bookshelf = {:item=>{:title=>"Alfons och soldatpappan",
                        :author=>"Gunilla Bergström"},
                        :available=>false,
                        :return_date=>Date.today.next_month(1).strftime('%m/%y')}
    expected_output = {:item=>{:title=>"Alfons och soldatpappan",
                               :author=>"Gunilla Bergström"},
                               :available=>false,
                               :return_date=>Date.today.next_month(1).strftime('%m/%y')}
    expect(subject.display_bookshelf).to eq expected_output
  end
end
