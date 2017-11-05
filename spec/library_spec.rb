require './lib/library'
require 'date'

describe Library do
  let(:person) { instance_double('Person',
                name: 'Mariza',
                my_books: [])
  }
  before(:all) { @collection = YAML.load_file('./lib/data.yml') }
  before(:each) { File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml } }

  it 'has a collection of books on initialize' do
    expect(subject.my_list).to a_kind_of(Array)
  end

  it 'has a collection of books' do
    expect(subject.my_list).not_to eq nil
  end

  it 'has is available to checkout' do
    expect(subject.my_list[0][:available]).to be true
  end

  after(:all) { File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml } }
end
