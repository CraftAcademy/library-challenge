require './lib/library.rb'
require 'yaml'
require 'date'

describe Library do
  before :each do
    @list = YAML.load_file('./lib/data.yml')
  end

  it 'displays books in library' do
    expect(subject.list).to eq @list
  end
end
