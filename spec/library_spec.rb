require_relative "../lib/library.rb"
require 'date'

describe Library do
  let(:objects) { instance_double()}

  collection = YAML.load_file('./lib/data.yml')
  
  it "is expected to show a list of books" do
    expect(subject.collection).to_not eq nil 
  end
end
  