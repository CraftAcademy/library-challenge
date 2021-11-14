require "./lib/visitor.rb"

describe Visitor do
  
  subject { described_class.new(name: "Giovanni") }

  it "is expected to have a :name on initialize" do
    expect(subject.name).to eq "Giovanni"
  end

  it "is expected to raise an error if no name is set" do
    expect { described_class.new }.to raise_error "A name is required"
  end
end