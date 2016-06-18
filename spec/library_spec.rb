require './lib/library.rb'
require 'yaml'
require 'date'

  describe Library do
    before do
      subject.catalog.each do |item|
    end
  end

  # has a catalog
  it 'is expected to have a catalog' do
    expect(subject.catalog).to_not eq nil
  end

  # has books in catalog


end
