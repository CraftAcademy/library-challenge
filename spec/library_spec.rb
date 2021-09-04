require_relative "../lib/library.rb"
require "date"

describe Library do
  # let(:objects) { instance_double() }

  subject { described_class.new }

  it "is expected to show a list of books" do
    expect(subject.collection).to_not eq nil
  end

  it "is expected to search for a specific book by title or author" do
    expected_output = YAML.load_file("./lib/data.yml").select { |book| book[:item][:title] == book }
    expect(subject.search("Alfons")).to eq expected_output
  end

  it "it is expected to search for any available book by title or author" do
    expected_output = YAML.load_file("./lib/data.yml").select { |book| book[:available] == true }
    expect(subject.available_books).to eq expected_output
  end


end
