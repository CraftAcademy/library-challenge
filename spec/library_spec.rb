require './lib/library.rb'

describe Library do

  let(:client) {instance_double('client')}

  before do
    collection = YAML.load_file('./lib/data.yml')
    allow(client).to receive(:bookshelf).and_return([])
  end

  after do
    subject.checkin("Alfons och soldatpappan", client)
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
    expect(subject.display_available_titles).to eq expected_output
  end

  it 'should change the availability to false and add return date' do
    expected_output = {:item=>{:title=>"Alfons och soldatpappan",
                        :author=>"Gunilla Bergström"},
                        :available=>false,
                        :return_date=>Date.today.next_month(1).strftime('%m/%y')}
    expect(subject.checkout("Alfons och soldatpappan", client)).to eq expected_output
  end

  it 'rejects checkout if there are outstanding overdue books' do
    expected_output = [{:item => {:title=>"Pippi Långstrump",
                      :author=>"Astrid Lindgren"},
                      :available=>false,
                      :return_date=>Date.today.prev_month.strftime('%m/%y')}]
    allow(client).to receive(:bookshelf).and_return(expected_output)
    response = 'You have overdue books'
    expect(subject.overdue_check(client)).to eq response

  end

  it 'returns books if found on title search' do
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

  it 'returns books if found on author search' do
    expected_output = [{:item=>{:title=>"Pippi Långstrump",
                                  :author=>"Astrid Lindgren"},
                                  :available=>false,
                                  :return_date=>nil},
                                {:item=>{:title=>"Pippi Långstrump går ombord",
                                   :author=>"Astrid Lindgren"},
                                   :available=>false,
                                   :return_date=>nil}]
    expect(subject.search('Astrid')).to eq expected_output
  end
end
