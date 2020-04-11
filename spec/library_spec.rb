require './lib/library.rb'
require 'date'
require 'yaml'

describe Library do
  subject { described_class.new()}
  it 'has collection on initialize' do
    expect(subject.collection).to be_truthy
  end
  
  it 'be able to view collection' do
    subject.view_collection
  end 

  it 'searches for a book title in collection' do
    expect(subject.search('Pippi Långstrump') ).to include(include(:available))
  end
  it 'searches for a book author in collection' do
    expect(subject.search('Astrid Lindgren') ).to include(include(:available))
  end
 end   

