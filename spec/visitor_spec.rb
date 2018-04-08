require './lib/visitor.rb'
require 'yaml'
require 'date'

describe Visitor do
  let!(:library){ instance_double('Library')}

  subject{described_class.new({name: 'Agnes', library: library})}

  it 'has a name in initialize' do
    expect(subject.name).not_to be nil
  end

  it 'see a list of books in library' do
    allow(library).to receive(:list).and_return('list')
    expect(subject.display_library_books).to eq 'list'
  end

  it 'get a list of available books' do
    allow(library).to receive(:available_books).and_return([{item: {title: "Someone To Watch Over Me", author: "Yrsa Sigurdardottir"}, available: true, return_date: nil}])
    expect(subject.display_available_books).to eq [{item: {title: "Someone To Watch Over Me", author: "Yrsa Sigurdardottir"}, available: true, return_date: nil}]
  end
end
