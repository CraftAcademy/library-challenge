require './lib/library.rb'
require 'date'
require 'yaml'
require 'pry'


describe Library do
  it 'has a catalog of books' do
    expected_catalog = YAML.load_file('./lib/data.yml')
    expect(subject.catalog).to eq expected_catalog
  end

  it 'checks list of books' do
    expect(subject.list_available_books).not_to be_empty
  end
end
