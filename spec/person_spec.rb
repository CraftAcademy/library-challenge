require './lib/person.rb'

describe Person do
  subject { described_class.new('Oliver') }
  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :books }

  it '#books returns an array' do
    expect(subject.books).to be_an_instance_of Array
  end
end
