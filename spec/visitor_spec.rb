require_relative '../lib/library'
require './lib/visitor'
require 'date'
require 'yaml'

describe Visitor do
  let(:library) { instance_double('Library', collection: YAML.load_file('./lib/data.yml')) }

  # subject { described_class.new(visitor: library) }


  # after do
  #   # YAML source info https://medium.com/launch-school/storing-objects-in-yaml-with-ruby-d02c60e0dc65
  #   test_data = YAML.load_file('./lib/data_unchanged.yml')
  #   File.open('./lib/data.yml', 'w') { |file| file.write test_data.to_yaml }
  # end

  #needs to see books already checkedout with returndates
  it 'is expected to show a list of all available books in library' do
    expected_output = YAML.load_file('./lib/data.yml').select { |book| book[:available] == true }
    # binding.pry
    expect(subject.visitor_available_books).to eq expected_output
  end

  it 'is expected to checkout a book successfully' do
    subject.checkout_book('Star Trek')
    time_add_month = Date.today.next_month(1).strftime('%Y-%m-%d')
    expected_output = { message: "Please return by date: #{time_add_month}" }
    # binding.pry
  end

  it 'is expected to display a return date within 30 days of checkout' do
    
    # binding.pry
    subject.checkout_book('The Prometheus Design')
    time_add_month = Date.today.next_month(1).strftime('%Y-%m-%d')
    expected_output = { message: "Please return by date: #{time_add_month}" }
  end


end
