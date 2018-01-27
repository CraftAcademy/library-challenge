require './lib/library.rb'

describe Library do

  let(:client) { double('client') }

  before do
    collection = YAML.load_file('./lib/data.yml')
    allow(client).to receive(:bookshelf).and_return('')
    allow(client).to receive(:bookshelf=)
  end

  it 'creates a new library' do
    library = Library.new
    expect(library).to_not be nil
  end

  it 'displays entire library catalogue' do
    collection = YAML.load_file('./lib/data.yml')
    expect(subject.display_library).to eq collection
  end

  xit 'displays what is available to be checked out' do
    expected_output = [{:item=>{:title=>"Alfons och soldatpappan",
                        :author=>"Gunilla Bergström"},
                        :available=>true,
                        :return_date=>nil}]
    expect(subject.available_titles).to eq expected_output
  end

  it 'adds checked out book to client\'s bookshelf' do
    subject.checkout('Alfons och soldatpappan')
    expect(client.bookshelf).to eq nil
  end


end
