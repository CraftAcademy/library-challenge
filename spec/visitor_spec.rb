require './lib/library'
require './lib/visitor'
require 'date'
require 'yaml'

describe Visitor do
  let(:library) { instance_double('Library', collection: YAML.load_file('./lib/data.yml')) }
  # subject { described_class.new(library:) }

  it 'is expected to show a list of all available books in library' do
    expected_output = YAML.load_file('./lib/data.yml').select { |book| book[:available] == true }
    # binding.pry
    expect(subject.visitor_available_books).to eq expected_output
  end
end
