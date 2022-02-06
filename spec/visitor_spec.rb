require './lib/visitor.rb'
require './lib/library.rb'
require 'yaml'
require 'date'

describe Visitor do

  let(:library) {instance_double('Library', collection: YAML.load_file('./lib/data.yml' ) )}

  it 'shows all available books' do
    expected_output = YAML.load_file('./lib/data.yml').select { |book| book[:available] == true }
    expect(subject.visitor_available_books(library)).to eq expected_output
  end

end