require_relative "../lib/library.rb"
require "date"

describe Library do
  # let(:objects) { instance_double() }

  subject { described_class.new }

  it "is expected to show a list of books" do
    expect(subject.collection).to_not eq nil
  end
end
