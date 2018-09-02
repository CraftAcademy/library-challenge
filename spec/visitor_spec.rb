require './lib/visitor.rb'
require './lib/library.rb'
require 'yaml'
require 'Date'

describe Visitor do

it "shows all available books" do
  expected_output = YAML.load_file('./lib/data.yml').select { |book| book[:available] == true }
  expect(subject.visitor_books_available).to eq expected_output
end



end