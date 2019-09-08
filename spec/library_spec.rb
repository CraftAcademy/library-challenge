require './lib/library.rb'

describe Library do 
  let(:person) { instance_double('Librarian') }
  subject { described_class.new({librarian: person}) }

  before :all do
    YAML.load_file('./lib/data.yml')
  end

  it 'responds to #collection' do 
    expect(subject).to respond_to :collection
  end

    it 'stores #books as an Array' do 
    expect(subject.collection).to be_a Array
  end

  it 'has books stored as a collection of hashes' do 
    expect(subject.collection.first).to be_a Hash
  end

  it 'can get a book from the list' do
    expect(subject.collection.first[:item][:title]).to eq "Alfons och soldatpappan"
  end

  it 'can tell if a specific book is available or not' do
    expect(subject.collection[1][:available]).to be false
  end

  it 'is expected to have an expiration date on initialize' do
    expected_date = Date.today.next_day(30).strftime('Any books have to be returned by: %d/%m/%y')
    expect(subject.exp_date).to eq expected_date
  end

  describe 'when loaning a book from the library' do  

    # it 'is expected to have a librarian' do
    #   expect(subject.librarian).to eq person
    # end

    # it 'is expected to raise error if no visitor is set' do
    #   expect { described_class.new }.to raise_error 'No librarian here.'
    # end

    it 'is expected to return all details of matching book titles' do
      expected_output = [{:item=>{:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>"2016-05-25"}]
      expect(subject.search('Åberg')).to eq expected_output
    end

    it 'is expected to return all details of the chosen book' do
      expected_output = {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}
      expect(subject.pick('Pippi Långstrump')).to eq expected_output
    end

    it 'is expected to return the index of the title of the chosen book' do 
      expect(subject.final_choice('Pippi Långstrump')).to eq [3]
    end

  end

end