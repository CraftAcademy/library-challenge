require './lib/library.rb'

describe Library do

  let(:client) { double('client') }

  before do
    collection = YAML.load_file('./lib/data.yml')
    allow(client).to receive(:bookshelf).and_return('')
    allow(client).to receive(:bookshelf=)
  end



  it 'displays entire library catalogue' do
    collection = YAML.load_file('./lib/data.yml')
    expect(subject.display_library).to eq collection
  end

  it 'displays what is available to be checked out' do
    expected_output = [{:item=>{:title=>"Alfons och soldatpappan",
                        :author=>"Gunilla Bergström"},
                        :available=>true,
                        :return_date=>nil}]
    expect(subject.available_titles).to eq expected_output
  end

  it 'should change the availability to false and add return date' do
    expected_output = {:item=>{:title=>"Alfons och soldatpappan",
                        :author=>"Gunilla Bergström"},
                        :available=>false,
                        :return_date=>Date.today.next_month(1).strftime('%m/%y')}
    expect(subject.checkout("Alfons och soldatpappan")).to eq expected_output
  end

  it 'returns books if found' do
    expected_output = [{:item=>{:title=>"Pippi Långstrump",
                                  :author=>"Astrid Lindgren"},
                                  :available=>false,
                                  :return_date=>nil},
                                {:item=>{:title=>"Pippi Långstrump går ombord",
                                   :author=>"Astrid Lindgren"},
                                   :available=>false,
                                   :return_date=>nil}]
    expect(subject.search('Pippi')).to eq expected_output
  end

end
